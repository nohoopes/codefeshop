package com.nhom2.data;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.nhom2.model.*;

public class ProductDAO {

    /**
     * Get Product By id
     * @param id
     * @return
     */
    public Product getProduct(int id) {

        Transaction transaction = null;
        Product product = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            product = session.get(Product.class, id);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return product;
    }

    /**
     * Get all products
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Product> listAllProduct() {
        try {
        	return HibernateUtil.getSessionFactory().openSession().createQuery("From Product ").getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
		return null;
    }
    public List<Product> listTypeProduct(String name, String type) {
        try {
        	return HibernateUtil.getSessionFactory().openSession().createQuery("From Product where name LIKE '%"+name+"%' and type ='"+type+"'").getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
		return null;
    }
    public List<Product> listSelectTypeProduct(String name, String type, String sort_by) {
        try {
        	if (type.equals("all") && sort_by.equals("none")) {
        		return HibernateUtil.getSessionFactory().openSession().createQuery("From Product where name LIKE '%"+name+"%'").getResultList();
        	}
        	if (!type.equals("all") && sort_by.equals("none") ) {
        		return HibernateUtil.getSessionFactory().openSession().createQuery("From Product where name LIKE '%"+name+"%' and type ='"+type+"'" ).getResultList();
        	}
        	if (type.equals("all")  && !sort_by.equals("none") ) {
        		return HibernateUtil.getSessionFactory().openSession().createQuery("From Product where name LIKE '%"+name+"%' ORDER BY "+sort_by +" asc").getResultList();
        	}
        	return HibernateUtil.getSessionFactory().openSession().createQuery("From Product where name LIKE '%"+name+"%' and type ='"+type+"' ORDER BY "+sort_by +" asc").getResultList();
        	
        } catch (Exception e) {
            e.printStackTrace();
        }
		return null;
    }
    
}