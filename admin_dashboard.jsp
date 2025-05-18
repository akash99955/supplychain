<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SupplyLink Admin Dashboard</title>
    <%-- Make sure this CSS file exists and is loaded --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css"> <%-- Keep footer CSS link --%>

    <%-- Font Awesome for Icons --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <%-- Main container using Flexbox for sidebar + main content --%>
    <div class="admin-container">

        <%-- Sidebar --%>
        <aside class="sidebar">
            <div class="logo">
                <h2>SupplyLink</h2>
            </div>
            <nav class="sidebar-nav">
                <a href="${pageContext.request.contextPath}/admin" class="nav-link active"><i class="fas fa-tachometer-alt nav-icon"></i>Dashboard</a>
                <a href="${pageContext.request.contextPath}/inventory" class="nav-link"><i class="fas fa-boxes nav-icon"></i>Inventory</a>
                <a href="${pageContext.request.contextPath}/orders" class="nav-link"><i class="fas fa-shopping-cart nav-icon"></i>Orders</a>
                <a href="${pageContext.request.contextPath}/suppliers" class="nav-link"><i class="fas fa-truck-loading nav-icon"></i>Suppliers</a>
                <a href="${pageContext.request.contextPath}/shipments" class="nav-link"><i class="fas fa-shipping-fast nav-icon"></i>Shipments</a>
                <a href="${pageContext.request.contextPath}/reports" class="nav-link"><i class="fas fa-chart-line nav-icon"></i>Reports</a>
            </nav>
        </aside>

        <%-- Main Content Area --%>
        <main class="main-content">
            <%-- Top Header within Main Content --%>
            <header class="top-header">
                <h1>Supply Chain Dashboard</h1>
                <div class="user-info">
                    <span><i class="fas fa-user-circle"></i> Welcome, ${sessionScope.user.username}</span>
                    <a href="${pageContext.request.contextPath}/logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </div>
            </header>

            <%-- Dashboard Specific Content --%>
            <section class="dashboard-content">

                <%-- Welcome Message --%>
                <div class="welcome-message">
                     <p>Welcome back, Admin! This dashboard provides a quick overview of your supply chain metrics and performance.</p>
                </div>

                 <%-- Overview Heading --%>
                <h2>Overview</h2>

                <%-- Stats Cards Container --%>
                <div class="stats-container">
                    <%-- Stat Card 1 --%>
                    <div class="stat-card total">
                        <div class="stat-icon">
                            <i class="fas fa-boxes fa-3x"></i>
                        </div>
                        <div class="stat-info">
                            <h3>Total Inventory Items</h3>
                            <p class="stat-value">${totalInventory}</p>
                        </div>
                    </div>

                    <%-- Stat Card 2 --%>
                    <div class="stat-card available">
                        <div class="stat-icon">
                            <i class="fas fa-exclamation-triangle fa-3x"></i>
                        </div>
                        <div class="stat-info">
                            <h3>Low Stock Items</h3>
                            <p class="stat-value">${lowStockItems}</p>
                        </div>
                    </div>

                    <%-- Stat Card 3 --%>
                    <div class="stat-card orders">
                        <div class="stat-icon">
                            <i class="fas fa-shopping-cart fa-3x"></i>
                        </div>
                        <div class="stat-info">
                            <h3>Pending Orders</h3>
                            <p class="stat-value">${pendingOrders}</p>
                        </div>
                    </div>

                    <%-- Stat Card 4 --%>
                    <div class="stat-card shipments">
                        <div class="stat-icon">
                            <i class="fas fa-truck fa-3x"></i>
                        </div>
                        <div class="stat-info">
                            <h3>Active Shipments</h3>
                            <p class="stat-value">${activeShipments}</p>
                        </div>
                    </div>
                </div> <%-- End stats-container --%>

                <%-- Additional Supply Chain Metrics --%>
                <h2>Performance Metrics</h2>
                <div class="metrics-container">
                    <div class="metric-card">
                        <h3>On-Time Delivery Rate</h3>
                        <div class="progress-container">
                            <div class="progress-bar" style="width: ${onTimeDeliveryRate}%;">
                                <span>${onTimeDeliveryRate}%</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="metric-card">
                        <h3>Inventory Turnover</h3>
                        <div class="metric-value">${inventoryTurnover}</div>
                        <div class="metric-trend ${inventoryTrendClass}">
                            <i class="fas ${inventoryTrendIcon}"></i> ${inventoryTrendValue}%
                        </div>
                    </div>
                    
                    <div class="metric-card">
                        <h3>Order Fulfillment</h3>
                        <div class="progress-container">
                            <div class="progress-bar" style="width: ${orderFulfillmentRate}%;">
                                <span>${orderFulfillmentRate}%</span>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- Recent Activities Section --%>
                <h2>Recent Activities</h2>
                <div class="activities-container">
                    <table class="activities-table">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Activity Type</th>
                                <th>Description</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${recentActivities}" var="activity">
                                <tr>
                                    <td>${activity.date}</td>
                                    <td>${activity.type}</td>
                                    <td>${activity.description}</td>
                                    <td><span class="status-badge ${activity.statusClass}">${activity.status}</span></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

            </section> <%-- End dashboard-content --%>

        </main> <%-- End main-content --%>
    </div> <%-- End admin-container --%>

    <%-- JavaScript for Dashboard Functionality --%>
    <script>
        // You can add any dashboard-specific JavaScript here
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize dashboard components
            console.log('Supply Chain Dashboard loaded successfully');
        });
    </script>
</body>
</html>