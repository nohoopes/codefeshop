package com.nhom2.data;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import com.nhom2.model.Bill;
import com.nhom2.model.Contact;
import com.nhom2.model.CusAccount;
import com.nhom2.model.Discount;
import com.nhom2.model.Product;

public class HibernateUtil {
 private static SessionFactory sessionFactory;

 public static SessionFactory getSessionFactory() {
  if (sessionFactory == null) {
   try {
    Configuration configuration = new Configuration();

    // Hibernate settings equivalent to hibernate.cfg.xml's properties
    Properties settings = new Properties();
    settings.put(Environment.DRIVER, "com.mysql.jdbc.Driver");
    
    settings.put(Environment.URL, "jdbc:mysql://us-cdbr-east-04.cleardb.com/heroku_32f53ee1463b8d6?useSSL=false");
    settings.put(Environment.USER, "b09152048e157a");
    settings.put(Environment.PASS, "60846286");
    
//    settings.put(Environment.URL, "jdbc:mysql://localhost:3306/codefe_product?useSSL=false");
//    settings.put(Environment.USER, "root");
//    settings.put(Environment.PASS, "123456");
    
    settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL5Dialect");
    settings.put(Environment.SHOW_SQL, "true");
    settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");

    settings.put(Environment.HBM2DDL_AUTO, "update");

    configuration.setProperties(settings);
    configuration.addAnnotatedClass(Product.class);
    configuration.addAnnotatedClass(CusAccount.class);
    configuration.addAnnotatedClass(Discount.class);
    configuration.addAnnotatedClass(Contact.class);
    configuration.addAnnotatedClass(Bill.class);

    ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
      .applySettings(configuration.getProperties()).build();
    System.out.println("Hibernate Java Config serviceRegistry created");
    sessionFactory = configuration.buildSessionFactory(serviceRegistry);
    return sessionFactory;

   } catch (Exception e) {
    e.printStackTrace();
   }
  }
  return sessionFactory;
 }
}