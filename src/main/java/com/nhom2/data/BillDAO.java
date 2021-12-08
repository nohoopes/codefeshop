package com.nhom2.data;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.nhom2.model.*;
public class BillDAO {
	public void addBill(Bill bil) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            
            transaction = session.beginTransaction();
            
            session.save(bil);
            
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}
