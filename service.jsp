<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Services</title>
</head>
<body>
	<div class="container">
        <h1>Supply Chain Service Dashboard</h1>

        <div class="card-grid">
            <!-- Supplier Section -->
            <div class="card">
                <h2>Supplier Company</h2>
                <ul>
                    <li>Add New Products</li>
                    <li>View Supply Orders</li>
                    <li>Update Stock Levels</li>
                    <li>Manage Deliveries</li>
                </ul>
                <a href="supplierDashboard.jsp">Go to Supplier Panel</a>
            </div>

            <!-- Distributor Section -->
            <div class="card">
                <h2>Distributor</h2>
                <ul>
                    <li>Receive Supplies from Supplier</li>
                    <li>Manage Product Distribution</li>
                    <li>Track Shipments</li>
                    <li>Monitor Inventory</li>
                </ul>
                <a href="distributorDashboard.jsp">Go to Distributor Panel</a>
            </div>

            <!-- Retailer Section -->
            <div class="card">
                <h2>Retailer</h2>
                <ul>
                    <li>Order Products from Distributor</li>
                    <li>Check Product Availability</li>
                    <li>View Sales Data</li>
                    <li>Manage Store Inventory</li>
                </ul>
                <a href="retailerDashboard.jsp">Go to Retailer Panel</a>
            </div>

            <!-- Customer Section -->
            <div class="card">
                <h2>Customer</h2>
                <ul>
                    <li>Browse Products</li>
                    <li>Place Orders</li>
                    <li>Track Purchases</li>
                    <li>Download Invoices</li>
                </ul>
                <a href="customerDashboard.jsp">Go to Customer Panel</a>
            </div>
        </div>
    </div>
</body>
</html>