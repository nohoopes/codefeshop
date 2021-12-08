package com.nhom2.data;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.nhom2.model.*;

public class CusAccountDao {

    public void saveUser(CusAccount cus) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(cus);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public CusAccount validate(String cusPhone, String password) {

        Transaction transaction = null;
        CusAccount cus = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            cus = (CusAccount) session.createQuery("FROM CusAccount U WHERE U.cusphone = :cusPhone").setParameter("cusPhone", cusPhone)
                .uniqueResult();

            if (cus != null && cus.getPassword().equals(password)) {
                return cus;
            }
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return null;
    }

}