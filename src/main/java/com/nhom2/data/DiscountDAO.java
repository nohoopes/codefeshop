package com.nhom2.data;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.nhom2.model.Discount;

public class DiscountDAO {
	public Discount getDiscount(int id) {

        Transaction transaction = null;
        Discount discount = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            discount = session.get(Discount.class, id);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return discount;
    }
	@SuppressWarnings("unchecked")
    public List<Discount> listAllDiscount() {
        try {
        	return HibernateUtil.getSessionFactory().openSession().createQuery("From Discount").getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
		return null;
    }
}
