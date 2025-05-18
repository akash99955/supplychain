<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>About Us - SupplyChainPro</title>
<!-- Favicon -->
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/system/favicon.ico"
	type="image/x-icon">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/footer.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/aboutus.css" />
</head>
<body>
	<jsp:include page="header.jsp" />

	<main class="about-container">
		<section class="hero-banner">
			<div class="hero-content">
				<h1>About SupplyChainPro</h1>
				<p class="tagline">Optimizing Logistics, Streamlining Supply Chains</p>
			</div>
		</section>

		<section class="mission-section">
			<div class="section-content">
				<h2>
					<i class="fas fa-bullseye"></i> Our Mission
				</h2>
				<p>SupplyChainPro empowers businesses with real-time visibility,
					automation, and analytics across their supply chains. Our platform
					reduces delivery delays, cuts inventory costs, and ensures consistent
					supply performance through intelligent coordination.</p>

				<div class="stats-grid">
					<div class="stat-card">
						<i class="fas fa-chart-line"></i>
						<h3>30% Faster</h3>
						<p>Order fulfillment improvement</p>
					</div>
					<div class="stat-card">
						<i class="fas fa-boxes"></i>
						<h3>10,000+</h3>
						<p>Products tracked across supply chains</p>
					</div>
					<div class="stat-card">
						<i class="fas fa-globe"></i>
						<h3>50+ Countries</h3>
						<p>Supporting global operations</p>
					</div>
				</div>
			</div>
		</section>

		<section class="features-section">
			<h2>
				<i class="fas fa-lightbulb"></i> Why We Built SupplyChainPro
			</h2>
			<p>Traditional supply chain systems were fragmented and inefficient:</p>

			<div class="problem-solution">
				<div class="problem">
					<h3>
						<i class="fas fa-exclamation-triangle"></i> The Problems
					</h3>
					<ul>
						<li><i class="fas fa-truck-loading"></i> Delayed shipments and lost orders</li>
						<li><i class="fas fa-warehouse"></i> Overstocking and understocking</li>
						<li><i class="fas fa-file-alt"></i> Paper-based inventory tracking</li>
						<li><i class="fas fa-lock-open"></i> Poor data security</li>
					</ul>
				</div>
				<div class="solution">
					<h3>
						<i class="fas fa-check-circle"></i> Our Solutions
					</h3>
					<ul>
						<li><i class="fas fa-network-wired"></i> End-to-end supply chain visibility</li>
						<li><i class="fas fa-chart-pie"></i> Smart demand forecasting</li>
						<li><i class="fas fa-database"></i> Centralized inventory management</li>
						<li><i class="fas fa-shield-alt"></i> Enterprise-level data protection</li>
					</ul>
				</div>
			</div>
		</section>

		<section class="team-section">
			<h2>
				<i class="fas fa-users"></i> Our Team
			</h2>
			<p>We are logistics experts, engineers, and innovators committed to global supply excellence:</p>

			<div class="team-values">
				<div class="value-card">
					<i class="fas fa-cogs"></i>
					<h3>Optimize Operations</h3>
					<p>We simplify complex logistics through automation</p>
				</div>
				<div class="value-card">
					<i class="fas fa-user-shield"></i>
					<h3>Build Trust</h3>
					<p>Transparency and security are at our core</p>
				</div>
				<div class="value-card">
					<i class="fas fa-lightbulb"></i>
					<h3>Innovate Daily</h3>
					<p>Continuous improvement is part of our DNA</p>
				</div>
			</div>
		</section>

		<section class="features-highlight">
			<h2>
				<i class="fas fa-star"></i> Key Features
			</h2>
			<div class="features-grid">
				<div class="feature-card">
					<i class="fas fa-tachometer-alt"></i>
					<h3>Live Dashboard</h3>
					<p>Track inventory, shipments, and performance in real time</p>
				</div>
				<div class="feature-card">
					<i class="fas fa-search-location"></i>
					<h3>Smart Tracking</h3>
					<p>Locate items in transit instantly with GPS-enabled insights</p>
				</div>
				<div class="feature-card">
					<i class="fas fa-user-cog"></i>
					<h3>Role-Based Access</h3>
					<p>Control system access by department or role</p>
				</div>
				<div class="feature-card">
					<i class="fas fa-clipboard-check"></i>
					<h3>Audit Trail</h3>
					<p>Get detailed logs of every shipment and transaction</p>
				</div>
				<div class="feature-card">
					<i class="fas fa-lock"></i>
					<h3>Top-Tier Security</h3>
					<p>Safeguard your data with multi-layer encryption</p>
				</div>
				<div class="feature-card">
					<i class="fas fa-tablet-alt"></i>
					<h3>Mobile Support</h3>
					<p>Access dashboards and reports from anywhere</p>
				</div>
			</div>
		</section>
	</main>

	<jsp:include page="footer.jsp" />

	<!-- JavaScript -->
	<script src="${pageContext.request.contextPath}/js/animations.js"></script>
</body>
</html>
