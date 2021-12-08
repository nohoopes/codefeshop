package com.nhom2.data;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.nhom2.model.Contact;

public class ContactDAO {
	public void saveContact(Contact con) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            
            transaction = session.beginTransaction();
            
            session.save(con);
            
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}
