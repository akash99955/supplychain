<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Supply Chain Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>

    <!-- Include header -->
    <jsp:include page="/WEB-INF/pages/header.jsp" />

    <main class="contact-container">
        <section class="contact-hero">
            <h1>Contact Our Team</h1>
            <p>We're here to help with your supply chain needs</p>
        </section>

        <div class="contact-wrapper">
            <section class="contact-form">
                <h2>Send Us a Message</h2>
                
                <c:if test="${not empty success}">
                    <div class="alert alert-success">${success}</div>
                </c:if>
                
                <c:if test="${not empty error}">
                    <div class="alert alert-error">${error}</div>
                </c:if>
                
                <form action="${pageContext.request.contextPath}/contact" method="post">
                    <div class="form-group">
                        <label for="name">Full Name*</label>
                        <input type="text" id="name" name="name" required 
                               value="${param.name}" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email*</label>
                        <input type="email" id="email" name="email" required
                               value="${param.email}" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="tel" id="phone" name="phone"
                               value="${param.phone}" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label for="subject">Subject*</label>
                        <select id="subject" name="subject" required class="form-control">
                            <option value="">Select a subject</option>
                            <option value="general" ${param.subject == 'general' ? 'selected' : ''}>General Inquiry</option>
                            <option value="support" ${param.subject == 'support' ? 'selected' : ''}>Technical Support</option>
                            <option value="sales" ${param.subject == 'sales' ? 'selected' : ''}>Sales Inquiry</option>
                            <option value="feedback" ${param.subject == 'feedback' ? 'selected' : ''}>Feedback</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="message">Message*</label>
                        <textarea id="message" name="message" rows="5" required
                                  class="form-control">${param.message}</textarea>
                    </div>
                    
                    <div class="form-group">
                        <button type="submit" class="btn-submit">Send Message</button>
                    </div>
                </form>
            </section>

            <section class="contact-info">
                <h2>Contact Information</h2>
                
                <div class="info-card">
                    <div class="info-icon">
                        <img src="${pageContext.request.contextPath}/resources/images/contact/location.png" alt="Location">
                    </div>
                    <div class="info-content">
                        <h3>Our Headquarters</h3>
                        <p>123 Supply Chain Avenue<br>Business District<br>New York, NY 10001</p>
                    </div>
                </div>
                
                <div class="info-card">
                    <div class="info-icon">
                        <img src="${pageContext.request.contextPath}/resources/images/contact/phone.png" alt="Phone">
                    </div>
                    <div class="info-content">
                        <h3>Phone Numbers</h3>
                        <p>Main: +1 (555) 123-4567<br>Support: +1 (555) 765-4321</p>
                    </div>
                </div>
                
                <div class="info-card">
                    <div class="info-icon">
                        <img src="${pageContext.request.contextPath}/resources/images/contact/email.png" alt="Email">
                    </div>
                    <div class="info-content">
                        <h3>Email Addresses</h3>
                        <p>General: info@supplychain.com<br>Support: support@supplychain.com</p>
                    </div>
                </div>
                
                <div class="business-hours">
                    <h3>Business Hours</h3>
                    <p>Monday - Friday: 9:00 AM - 6:00 PM<br>
                    Saturday: 10:00 AM - 2:00 PM<br>
                    Sunday: Closed</p>
                </div>
            </section>
        </div>
    </main>

    <!-- Include footer -->
    <jsp:include page="/WEB-INF/pages/footer.jsp" />

    <!-- Optional JavaScript for form validation -->
    <script src="${pageContext.request.contextPath}/js/contact.js"></script>
</body>
</html>