<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="supply" value="${requestScope.Supplies}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Supply</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/update.css" />
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
            <h2>Update Supply Information</h2>

            <c:if test="${not empty error}">
                <p class="error-message">${error}</p>
            </c:if>

            <c:if test="${not empty success}">
                <p class="success-message">${success}</p>
            </c:if>

            <form action="${contextPath}/modifySupplies" method="post" enctype="multipart/form-data">
                <input type="hidden" name="action" value="update" />
                <input type="hidden" name="supplyId" value="${supply.id}" />

                <div class="row">
                    <div class="col">
                        <label for="name">Supply Name:</label>
                        <input type="text" id="name" name="name" value="${supply.name}" required />
                    </div>
                    <div class="col">
                        <label for="category">Category:</label>
                        <select id="category" name="category" required>
                            <option value="electronics" <c:if test="${supply.category == 'electronics'}">selected</c:if>>Electronics</option>
                            <option value="furniture" <c:if test="${supply.category == 'furniture'}">selected</c:if>>Furniture</option>
                            <option value="stationery" <c:if test="${supply.category == 'stationery'}">selected</c:if>>Stationery</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <label for="quantity">Quantity:</label>
                        <input type="number" id="quantity" name="quantity" value="${supply.quantity}" min="1" required />
                    </div>
                    <div class="col">
                        <label for="supplier">Supplier:</label>
                        <input type="text" id="supplier" name="supplier" value="${supply.supplier}" required />
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <label for="price">Price (USD):</label>
                        <input type="number" id="price" name="price" value="${supply.price}" step="0.01" min="0" required />
                    </div>
                    <div class="col">
                        <label for="dateReceived">Date Received:</label>
                        <input type="date" id="dateReceived" name="dateReceived" value="${supply.dateReceived}" required />
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <label for="image">Supply Image:</label>
                        <input type="file" id="image" name="image" />
                    </div>
                </div>

                <button type="submit">Update Supply</button>
            </form>
        </div>
    </div>

</body>
</html>
