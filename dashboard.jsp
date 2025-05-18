<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Dashboard</title>
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/dashboard.css" />
</head>
<body>

	<div class="container">
		<div class="sidebar">
			<ul class="nav">
				<li><a href="${contextPath}/dashboard"><span class="icon">🏠</span> Dashboard</a></li>
				<li><a href="${contextPath}/adminOrder"><span class="icon">📦</span> Order List</a></li>
				<li><a href="${contextPath}/modifySupplies"><span class="icon">📋</span> Supplies</a></li>
				<li><a href="${contextPath}/supplyUpdate"><span class="icon">✏️</span> Update Supply</a></li>
			</ul>
			<div class="logout">
				<form action="${contextPath}/logout" method="post">
					<input type="submit" class="nav-button" value="Logout" />
				</form>
			</div>
		</div>

		<div class="content">
			<div class="header">
				<div class="info-box">
					<h3>Total Supplies</h3>
					<p>${empty total ? 0 : total}</p>
				</div>
				<div class="info-box">
					<h3>Electronics</h3>
					<p>${empty electronics ? 0 : electronics}</p>
				</div>
				<div class="info-box">
					<h3>Furniture</h3>
					<p>${empty furniture ? 0 : furniture}</p>
				</div>
				<div class="info-box">
					<h3>Stationery</h3>
					<p>${empty stationery ? 0 : stationery}</p>
				</div>
			</div>

			<div class="card">
				<div>
					<h2>Welcome, Admins!</h2>
					<p>Supply Management Dashboard</p>
					<br /><br />
					<p>
						Welcome to the Supply Management System. Efficiently track and manage
						your inventory, orders, and vendors with ease using our admin tools.
						Stay on top of stock levels and ensure smooth operations.
					</p>
				</div>
				<img src="${contextPath}/resources/images/system/warehouse.jpg" alt="warehouse">
			</div>

			<div class="table-container">
				<h3>Recently Added Supplies</h3>
				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Category</th>
							<th>Quantity</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="supply" items="${supplyList}">
							<tr>
								<td>${supply.id}</td>
								<td>${supply.name}</td>
								<td>${supply.category}</td>
								<td>${supply.quantity}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>
