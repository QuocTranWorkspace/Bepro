# Be.pro E-commerce Platform

## Overview

Be.pro is a modern e-commerce platform built with Spring Boot, offering a comprehensive shopping experience with product browsing, user authentication, shopping cart functionality, and an administrative backend for content management.

This application provides a full-featured online shopping solution, including product listings, detailed product views, user account management, and an administrative interface for inventory and order management.

## Technologies

- **Backend**: Java 17, Spring Boot 2.7.x
- **Frontend**: JSP, Bootstrap 5, jQuery
- **Database**: MySQL 8.0
- **Build Tool**: Maven
- **Security**: Spring Security
- **Additional Libraries**:
    - Spring Data JPA
    - Spring Validation
    - Lombok
    - SLF4J/Logback for logging

## Prerequisites

Before running this application, ensure you have the following installed:

- JDK 17 or newer
- Maven 3.8+
- MySQL 8.0
- Git

## Setup and Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/finalProject.git
cd finalProject
```

### 2. Configure Database

Create a MySQL database and update the application properties with your database configuration.

```properties
# src/main/resources/application.properties

spring.datasource.url=jdbc:mysql://localhost:3306/bepro_ecommerce?useSSL=false&serverTimezone=UTC
spring.datasource.username=your_username
spring.datasource.password=your_password

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect
```

### 3. Build and Run the Application

```bash
# Build the project
mvn clean install

# Run the application
mvn spring-boot:run

# Alternatively, you can run the JAR file
java -jar target/finalProject-0.0.1-SNAPSHOT.jar
```

After starting the application, you can access it at http://localhost:8080

## Project Structure

```
finalProject/
├── src/
│   ├── main/
│   │   ├── java/uni/yourUniversity/finalProject/
│   │   │   ├── config/          # Configuration classes
│   │   │   ├── controller/      # MVC controllers
│   │   │   ├── dto/             # Data Transfer Objects
│   │   │   ├── entity/          # JPA entities
│   │   │   ├── exception/       # Custom exceptions
│   │   │   ├
│   │   │   ├── service/         # Business logic
│   │   │   └── FinalProjectApplication.java  # Main class
│   │   ├── resources/
│   │   │   ├── static/          # CSS, JS, images
│   │   │   │   ├── css/
│   │   │   │   │   ├── customerCSS/  # Customer-facing styles
│   │   │   │   │   └── adminCSS/     # Admin styles
│   │   │   │   ├── js/
│   │   │   │   │   ├── customerJS/   # Customer-facing scripts
│   │   │   │   │   └── adminJS/      # Admin scripts
│   │   │   │   └── img/         # Image assets
│   │   │   └── application.properties  # App configuration
│   │   └── webapp/
│   │       └── WEB-INF/
│   │           ├── views/       # JSP views
│   │           │   ├── common/  # Shared components (header, footer)
│   │           │   ├── customer/  # Customer-facing pages
│   │           │   │   └── layout/  # Customer layouts
│   │           │   └── administrator/  # Admin pages
│   │           └── resources/  # Additional web resources
│   └── test/                  # Unit and integration tests
│       └── java/uni/yourUniversity/finalProject/
├── pom.xml                    # Maven configuration
└── README.md                  # This file
```

## Key Features

- Responsive user interface compatible with desktop and mobile devices
- User registration and authentication
- Product catalog with search, filtering, and pagination
- Product details with images, descriptions, and specifications
- Shopping cart and checkout process
- Administrative dashboard with sales analytics
- Product management interface for administrators
- Order tracking and management

## Endpoints

### Customer-Facing Pages

| Endpoint | Description | Access Level |
|----------|-------------|-------------|
| `/home` | Homepage with featured products and categories | Public |
| `/login` | User authentication page | Public |
| `/register` | New user registration | Public |
| `/product` | Product catalog with filtering and pagination | Public |
| `/productDetail/{id}` | Detailed view of a specific product | Public |
| `/cart/checkout` | Shopping cart and checkout process | Authenticated Users |

### Administrative Interface

| Endpoint | Description | Access Level |
|----------|-------------|-------------|
| `/administrator/dashboard` | Admin dashboard with sales overview and analytics | Administrators |
| `/administrator/product` | Interface for adding/editing product details | Administrators |
| `/administrator/productlist` | List of all products with management options | Administrators |

## Implementation Details

### Controller Structure

Your application follows the MVC pattern with dedicated controllers for different sections:

```java
// Example customer controller
package uni.yourUniversity.finalProject.controller;

@Controller
public class HomeController {
    @GetMapping("/home")
    public String home(Model model) {
        // Logic to fetch featured products
        return "customer/home";
    }
}

// Example admin controller
@Controller
@RequestMapping("/administrator")
public class AdminProductController {
    @GetMapping("/product")
    public String productForm(Model model) {
        // Logic for product form
        return "administrator/product";
    }
}
```

### Entity Models

The application uses JPA entities to model data:

```java
package uni.yourUniversity.finalProject.entity;

@Entity
@Table(name = "products")
@Data
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String title;
    private String avatar;
    private BigDecimal price;
    private BigDecimal priceSale;
    
    // Relationships, other fields and methods
}
```

### View Templates

JSP views are organized by functionality:

- `/WEB-INF/views/customer/` - Contains all customer-facing pages
- `/WEB-INF/views/administrator/` - Contains all admin pages
- `/WEB-INF/views/common/` - Contains shared components like headers and footers

## Security

The application implements Spring Security for authentication and authorization:

- Public pages are accessible to all users
- Customer features require user authentication
- Administrative endpoints require admin role
- Password encryption using BCrypt
- CSRF protection
- Session management

```java
package uni.yourUniversity.finalProject.config;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    // Security configuration
}
```

## Configuration Options

Additional configuration can be applied through application properties:

```properties
# File upload settings
spring.servlet.multipart.max-file-size=10MB
spring.servlet.multipart.max-request-size=10MB

# Server port
server.port=8080

# Logging configuration
logging.level.org.springframework=INFO
logging.level.uni.yourUniversity.finalProject=DEBUG

# Custom application properties
app.upload.dir=./uploads
```

## Deployment

### Deploying as a JAR

1. Build the project: `mvn clean package`
2. Run the JAR: `java -jar target/finalProject-0.0.1-SNAPSHOT.jar`

### Deploying to a Servlet Container

1. Change packaging in pom.xml to `war`
2. Build the WAR file: `mvn clean package`
3. Deploy the WAR file to your servlet container (Tomcat, Jetty, etc.)

### Environment-Specific Configuration

For different environments (dev, test, prod), use Spring profiles:

```bash
# For development
java -jar app.jar --spring.profiles.active=dev

# For production
java -jar app.jar --spring.profiles.active=prod
```

## Development Guidelines

- Follow standard Java coding conventions
- Use proper layering (controller, service, repository)
- Write unit tests for all new features
- Document API endpoints
- Validate all input data
- Handle exceptions appropriately

## Troubleshooting

Common issues and solutions:

- **Database Connection Issues**: Verify database credentials and ensure MySQL is running
- **Upload Problems**: Check directory permissions for file uploads
- **Performance Issues**: Enable debug logging to identify bottlenecks
- **JSP Rendering Issues**: Ensure proper tag libraries are included

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Spring Boot team for the excellent framework
- Bootstrap team for the responsive UI components
- The open-source community for various libraries used in this project