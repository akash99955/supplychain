<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SupplyChain - Available Inventory</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/inventory.css">
    <style>
        .category-header {
            background-color: #f5f7fa;
            border-left: 4px solid #3498db;
        }
        .category-title {
            margin: 0;
            padding: 10px 15px;
            color: #2c3e50;
            font-size: 1.2em;
            font-weight: 600;
        }
        .category-items {
            background-color: #fff;
        }
        .empty-category {
            padding: 15px;
            color: #7f8c8d;
            font-style: italic;
        }
        .inventory-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 5px;
        }
        .inventory-table th {
            background-color: #34495e;
            color: white;
            padding: 12px 15px;
            text-align: left;
        }
        .inventory-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #ecf0f1;
            vertical-align: middle;
        }
        .inventory-item:hover {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <main class="main-container inventory-content">
        <div class="banner-container">
            <img class="banner-image" src="${pageContext.request.contextPath}/resources/images/system/warehouse-banner.jpg" alt="Supply Chain Banner" />
        </div>

        <header class="page-header">
            <h1 class="page-title">Inventory Dashboard</h1>
            <div class="user-welcome">
                <c:if test="${not empty sessionScope.user}">
                    <span>Welcome, ${sessionScope.user.fullName}</span>
                    <span class="user-role">
                        (<c:choose>
                            <c:when test="${sessionScope.user.roleId == 1}">Admin</c:when>
                            <c:when test="${sessionScope.user.roleId == 2}">Manager</c:when>
                            <c:when test="${sessionScope.user.roleId == 3}">Staff</c:when>
                            <c:otherwise>User</c:otherwise>
                        </c:choose>)
                    </span>
                    <a href="${pageContext.request.contextPath}/logout" class="user-action-link">Logout</a>
                </c:if>
            </div>
        </header>

        <c:if test="${not empty requestScope.errorMessage}">
            <div class="message error-message">${requestScope.errorMessage}</div>
        </c:if>
        <c:if test="${not empty param.success}">
            <div class="message success-message">${param.success}</div>
        </c:if>

        <div class="quick-actions">
            <a href="${pageContext.request.contextPath}/addItem" class="action-button">
                <i class="fas fa-plus-circle"></i> Add New Item
            </a>
            <form action="${pageContext.request.contextPath}/home" method="get" class="search-form">
                <input type="text" name="searchQuery" placeholder="Search inventory..." value="${param.searchQuery}">
                <button type="submit"><i class="fas fa-search"></i> Search</button>
                <c:if test="${not empty param.searchQuery}">
                    <a href="${pageContext.request.contextPath}/home" class="clear-search">Clear</a>
                </c:if>
            </form>
        </div>

        <section class="inventory-display-area">
            <h2 class="results-heading">
                <c:choose>
                    <c:when test="${not empty param.searchQuery}">
                        Search Results for "${param.searchQuery}"
                    </c:when>
                    <c:otherwise>
                        Current Inventory by Category
                    </c:otherwise>
                </c:choose>
            </h2>

            <div class="inventory-table-container">
                <table class="inventory-table">
                    <thead>
                        <tr>
                            <th>SKU</th>
                            <th>Item Name</th>
                            <th>Quantity</th>
                            <th>Location</th>
                            <th>Unit Price</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty searchResults}">
                                <c:forEach var="item" items="${searchResults}">
                                    <tr class="inventory-item">
                                        <td>${item.sku}</td>
                                        <td>${item.name}</td>
                                        <td>${item.quantity}</td>
                                        <td>${item.location}</td>
                                        <td>$${item.unitPrice}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${item.quantity <= 0}">
                                                    <span class="status-badge out-of-stock">Out of Stock</span>
                                                </c:when>
                                                <c:when test="${item.quantity < 10}">
                                                    <span class="status-badge low-stock">Low Stock</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="status-badge in-stock">In Stock</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="action-buttons">
                                            <a href="${pageContext.request.contextPath}/editItem?id=${item.id}" class="action-button edit">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>

                            <c:when test="${not empty categorizedSupplies}">
                                <c:forEach var="categoryEntry" items="${categorizedSupplies}">
                                    <tr class="category-header">
                                        <td colspan="7" class="category-title">${categoryEntry.key}</td>
                                    </tr>
                                    <c:choose>
                                        <c:when test="${not empty categoryEntry.value}">
                                            <c:forEach var="item" items="${categoryEntry.value}">
                                                <tr class="inventory-item category-items">
                                                    <td>${item.sku}</td>
                                                    <td>
                                                        <a href="${pageContext.request.contextPath}/itemDetail?id=${item.id}">
                                                            ${item.name}
                                                        </a>
                                                    </td>
                                                    <td>${item.quantity}</td>
                                                    <td>${item.location}</td>
                                                    <td>$${item.unitPrice}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${item.quantity <= 0}">
                                                                <span class="status-badge out-of-stock">Out of Stock</span>
                                                            </c:when>
                                                            <c:when test="${item.quantity < 10}">
                                                                <span class="status-badge low-stock">Low Stock</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="status-badge in-stock">In Stock</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="action-buttons">
                                                        <a href="${pageContext.request.contextPath}/editItem?id=${item.id}" class="action-button edit">
                                                            <i class="fas fa-edit"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr class="empty-category">
                                                <td colspan="7">No items available in this category</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:when>

                            <c:otherwise>
                                <tr>
                                    <td colspan="7" class="no-results">No inventory items found.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </section>
    </main>

    <jsp:include page="footer.jsp" />

    <script src="${pageContext.request.contextPath}/js/inventory.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        console.log('Categories in DOM:', document.querySelectorAll('.category-header').length);
        <c:if test="${not empty categorizedSupplies}">
            console.log('Server sent categories:', {
                <c:forEach var="categoryEntry" items="${categorizedSupplies}">
                    '${categoryEntry.key}': ${categoryEntry.value.size()},
                </c:forEach>
            });
        </c:if>
        document.querySelectorAll('.empty-category').forEach(el => {
            console.log('Empty category detected:', el.closest('tr').previousElementSibling.textContent.trim());
        });
    });
    </script>
</body>
</html>
