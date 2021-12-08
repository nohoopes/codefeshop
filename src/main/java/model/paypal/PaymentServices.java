package model.paypal;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

public class PaymentServices {
	private static final String CLIENT_ID = "AapY4y3xvf4QgJ74uD33wzMFPcxdcRn3zemhzJZ1FcT6ibontr7YjXe2h52zOMqmLK8JNZUy57C9oxaw";
	private static final String CLIENT_SECRET = "EKdtknvFCJjFMPo4cj8KR_5JBU3htPEju0PP1YREvbGMKa9gNaOiiDYPv5UDSmuRybKXOTKIFDheZ7UI";
	private static final String MODE = "sandbox";

	public String authorizePayment(OrderDetail orderDetail, String user_firstname, String user_lastname, String email, String cancel_url, String return_url)
			throws PayPalRESTException {

		Payer payer = getPayerInformation(user_firstname, user_lastname, email);
		RedirectUrls redirectUrls = getRedirectURLs(cancel_url, return_url);
		//RedirectUrls redirectUrls = getRedirectURLs();
		List<Transaction> listTransaction = getTransactionInformation(orderDetail);

		Payment requestPayment = new Payment();
		requestPayment.setTransactions(listTransaction);
		requestPayment.setRedirectUrls(redirectUrls);
		requestPayment.setPayer(payer);
		requestPayment.setIntent("authorize");

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

		Payment approvedPayment = requestPayment.create(apiContext);

		System.out.println("=== CREATED PAYMENT: ====");
		System.out.println(approvedPayment);

		return getApprovalLink(approvedPayment);

	}

	private Payer getPayerInformation(String firstname, String lastname, String email) {
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");
		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName(firstname)
				.setLastName(lastname)
				.setEmail(email);

		payer.setPayerInfo(payerInfo);

		return payer;
	}
	private RedirectUrls getRedirectURLs(String cancel_url, String return_url) {
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl(cancel_url);
		redirectUrls.setReturnUrl(return_url);

		return redirectUrls;
	}
	private RedirectUrls getRedirectURLs() {
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl("http://localhost:8085/fproject/cancel.jsp");
		redirectUrls.setReturnUrl("http://localhost:8085/fproject/review_payment");

		return redirectUrls;
	}

	private List<Transaction> getTransactionInformation(OrderDetail orderDetail) {
		Details details = new Details();
		details.setShipping(orderDetail.getShipping());
		details.setSubtotal(orderDetail.getSubtotal());
		details.setTax(orderDetail.getTax());

		Amount amount = new Amount();
		amount.setCurrency("USD");
		amount.setTotal(orderDetail.getTotal());
		amount.setDetails(details);

		Transaction transaction = new Transaction();
		transaction.setAmount(amount);
		transaction.setDescription("Your orders will be arrive soon!");

		ItemList itemList = new ItemList();
		List<Item> items = new ArrayList<>();

		Item item = new Item();
		item.setCurrency("USD");
		item.setName(orderDetail.getProductName());
		item.setPrice(orderDetail.getSubtotal());
		item.setTax(orderDetail.getTax());
		item.setQuantity("1");

		items.add(item);
		itemList.setItems(items);
		transaction.setItemList(itemList);

		List<Transaction> listTransaction = new ArrayList<>();
		listTransaction.add(transaction);

		return listTransaction;
	}

	private String getApprovalLink(Payment approvedPayment) {
		List<Links> links = approvedPayment.getLinks();
		String approvalLink = null;

		for (Links link : links) {
			if (link.getRel().equalsIgnoreCase("approval_url")) {
				approvalLink = link.getHref();
				break;
			}
		}

		return approvalLink;
	}

	public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {
		PaymentExecution paymentExecution = new PaymentExecution();
		paymentExecution.setPayerId(payerId);

		Payment payment = new Payment().setId(paymentId);

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

		return payment.execute(apiContext, paymentExecution);
	}

	public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		return Payment.get(apiContext, paymentId);
	}
}
