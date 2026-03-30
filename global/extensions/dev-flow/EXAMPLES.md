# Examples and Use Cases

This document provides comprehensive examples and real-world use cases for Dev Flow, demonstrating how to use the extension effectively in various scenarios.

## Table of Contents

- [Getting Started Examples](#getting-started-examples)
- [Real-World Use Cases](#real-world-use-cases)
- [Advanced Examples](#advanced-examples)
- [Troubleshooting Examples](#troubleshooting-examples)
- [Best Practices](#best-practices-in-action)

## Getting Started Examples

### Example 1: Simple Web Feature

**Scenario**: Add a contact form to a React website

```bash
# Step 1: Create PRD for the contact form
/dev:create-prd "Add contact form with validation and email sending to React website"

# Step 2: Generate detailed tasks
/dev:generate-tasks "0001-prd-contact-form-validation-email"

# Step 3: Work through implementation
/dev:process-task-list "tasks-0001-prd-contact-form-validation-email"
```

**Expected Output**:
- Creates comprehensive PRD with form validation requirements
- Generates tasks including: component creation, validation logic, email service integration, testing
- Provides step-by-step implementation guidance

### Example 2: Backend API Endpoint

**Scenario**: Create a user authentication API

```bash
# Step 1: Create PRD for authentication system
/dev:create-prd "Implement JWT-based authentication system with registration, login, and password reset"

# Step 2: Generate implementation tasks
/dev:generate-tasks "0002-prd-jwt-authentication-system"

# Step 3: Execute implementation
/dev:process-task-list "tasks-0002-prd-jwt-authentication-system"
```

**Expected Output**:
- Database schema design
- JWT token handling
- API endpoint implementation
- Security considerations
- Test cases

### Example 3: Mobile App Feature

**Scenario**: Add push notifications to a React Native app

```bash
# Step 1: Plan the feature
/dev:create-prd "Integrate push notifications for real-time user alerts in React Native app"

# Step 2: Break down tasks
/dev:generate-tasks "0003-prd-push-notifications-react-native"

# Step 3: Implement step by step
/dev:process-task-list "tasks-0003-prd-push-notifications-react-native"
```

## Real-World Use Cases

### Use Case 1: E-commerce Platform Development

**Project**: Building a full-stack e-commerce platform

```bash
# Feature 1: Product catalog
/dev:create-prd "Create product catalog with categories, search, and filtering"
/dev:generate-tasks "0001-prd-product-catalog-search-filter"
/dev:process-task-list "tasks-0001-prd-product-catalog-search-filter"

# Feature 2: Shopping cart
/dev:create-prd "Implement shopping cart with add/remove items and quantity management"
/dev:generate-tasks "0002-prd-shopping-cart-management"
/dev:process-task-list "tasks-0002-prd-shopping-cart-management"

# Feature 3: Checkout process
/dev:create-prd "Build checkout process with payment integration and order confirmation"
/dev:generate-tasks "0003-prd-checkout-payment-integration"
/dev:process-task-list "tasks-0003-prd-checkout-payment-integration"
```

### Use Case 2: Data Analysis Pipeline

**Project**: Creating a data processing and visualization pipeline

```bash
# Step 1: Data ingestion
/dev:create-prd "Build data ingestion system for CSV and JSON files with validation"
/dev:generate-tasks "0001-prd-data-ingestion-validation"
/dev:process-task-list "tasks-0001-prd-data-ingestion-validation"

# Step 2: Data processing
/dev:create-prd "Implement data transformation and cleaning pipeline"
/dev:generate-tasks "0002-prd-data-transformation-cleaning"
/dev:process-task-list "tasks-0002-prd-data-transformation-cleaning"

# Step 3: Visualization dashboard
/dev:create-prd "Create interactive dashboard for data visualization"
/dev:generate-tasks "0003-prd-interactive-dashboard-visualization"
/dev:process-task-list "tasks-0003-prd-interactive-dashboard-visualization"
```

### Use Case 3: SaaS Application

**Project**: Multi-tenant SaaS application with user management

```bash
# Feature 1: Multi-tenancy
/dev:create-prd "Implement multi-tenant architecture with data isolation"
/dev:generate-tasks "0001-prd-multi-tenant-data-isolation"
/dev:process-task-list "tasks-0001-prd-multi-tenant-data-isolation"

# Feature 2: User roles and permissions
/dev:create-prd "Create role-based access control system"
/dev:generate-tasks "0002-prd-role-based-access-control"
/dev:process-task-list "tasks-0002-prd-role-based-access-control"

# Feature 3: Billing integration
/dev:create-prd "Integrate subscription billing with multiple pricing tiers"
/dev:generate-tasks "0003-prd-subscription-billing-tiers"
/dev:process-task-list "tasks-0003-prd-subscription-billing-tiers"
```

## Advanced Examples

### Example 1: Microservices Architecture

**Scenario**: Breaking down a monolithic application into microservices

```bash
# Planning the migration
/dev:create-prd "Migrate monolithic user management system to microservices architecture"

# Complex task generation
/dev:generate-tasks "0001-prd-microservices-migration-user-management"

# Implementation with careful coordination
/dev:process-task-list "tasks-0001-prd-microservices-migration-user-management"
```

**Expected Complex Tasks**:
- Service boundary definition
- API gateway setup
- Database separation
- Inter-service communication
- Monitoring and logging
- Deployment pipeline updates

### Example 2: Legacy System Modernization

**Scenario**: Modernizing a legacy codebase

```bash
# Assessment and planning
/dev:create-prd "Modernize legacy PHP application to modern Node.js stack"

# Step-by-step migration strategy
/dev:generate-tasks "0001-prd-legacy-modernization-php-nodejs"

# Careful implementation
/dev:process-task-list "tasks-0001-prd-legacy-modernization-php-nodejs"
```

### Example 3: Machine Learning Integration

**Scenario**: Adding ML capabilities to an existing application

```bash
# ML feature planning
/dev:create-prd "Integrate machine learning for personalized recommendations"

# Implementation planning
/dev:generate-tasks "0001-prd-ml-recommendation-system"

# Step-by-step integration
/dev:process-task-list "tasks-0001-prd-ml-recommendation-system"
```

## Troubleshooting Examples

### Example 1: Fixing Common Issues

**Issue**: Generated code doesn't match project structure

```bash
# Check current progress
/dev:list-tasks

# Review and adjust approach
/dev:list-prds

# Continue with corrected implementation
/dev:process-task-list "tasks-feature-name"
```

**Solution Process**:
1. Identify where the divergence occurred
2. Adjust remaining tasks to match project structure
3. Continue with updated task list

### Example 2: Handling Large Features

**Challenge**: Feature is too complex for single implementation

```bash
# Break into smaller features
/dev:create-prd "Phase 1: Basic user authentication"
/dev:create-prd "Phase 2: Advanced user profiles"
/dev:create-prd "Phase 3: Social login integration"

# Implement incrementally
/dev:generate-tasks "0001-prd-basic-authentication"
/dev:process-task-list "tasks-0001-prd-basic-authentication"
```

### Example 3: Managing Dependencies

**Scenario**: Tasks have complex dependencies

```bash
# Plan with dependency awareness
/dev:create-prd "Feature X with careful dependency management"

# Review generated task order
/dev:generate-tasks "0001-prd-feature-x-dependencies"

# Adjust task order if needed
# (Manual editing of task list may be required)

# Continue with implementation
/dev:process-task-list "tasks-0001-prd-feature-x-dependencies"
```

## Best Practices in Action

### Practice 1: Iterative Development

```bash
# Start with MVP
/dev:create-prd "MVP: Basic feature core functionality"
/dev:generate-tasks "0001-prd-feature-mvp"
/dev:process-task-list "tasks-0001-prd-feature-mvp"

# Add enhancements
/dev:create-prd "Phase 2: Enhanced feature with advanced capabilities"
/dev:generate-tasks "0002-prd-feature-enhanced"
/dev:process-task-list "tasks-0002-prd-feature-enhanced"
```

### Practice 2: Test-Driven Development

```bash
# Include testing in PRD
/dev:create-prd "Feature with comprehensive test coverage"

# Generated tasks will include testing
/dev:generate-tasks "0001-prd-feature-with-tests"

# Implementation includes tests
/dev:process-task-list "tasks-0001-prd-feature-with-tests"
```

### Practice 3: Documentation-First

```bash
# Plan with documentation
/dev:create-prd "Feature with complete documentation requirements"

# Documentation tasks included
/dev:generate-tasks "0001-prd-feature-with-documentation"

# Documentation implemented alongside code
/dev:process-task-list "tasks-0001-prd-feature-with-documentation"
```

## Command Combination Examples

### Example 1: Full Feature Development Workflow

```bash
# Complete workflow for user management feature
/dev:create-prd "Complete user management system with CRUD operations"
/dev:generate-tasks "0001-prd-user-management-crud"
/dev:process-task-list "tasks-0001-prd-user-management-crud"

# Review progress
/dev:list-tasks

# Clean up completed work
/dev:cleanup
```

### Example 2: Multi-Feature Project Management

```bash
# Plan multiple features
/dev:create-prd "Feature A: User authentication"
/dev:create-prd "Feature B: Content management"
/dev:create-prd "Feature C: Analytics dashboard"

# Check all PRDs
/dev:list-prds

# Work on specific feature
/dev:generate-tasks "0002-prd-content-management"
/dev:process-task-list "tasks-0002-prd-content-management"

# Monitor overall progress
/dev:list-tasks
```

## Tips for Effective Usage

### 1. Feature Description Best Practices

```bash
# Good example - specific and detailed
/dev:create-prd "Create user authentication system with JWT tokens, password reset, email verification, and social login integration"

# Less effective - too vague
/dev:create-prd "Add auth"
```

### 2. Working with Complex Projects

```bash
# For large projects, break into logical phases
/dev:create-prd "Phase 1: Core infrastructure setup"
/dev:create-prd "Phase 2: Basic functionality"
/dev:create-prd "Phase 3: Advanced features"
```

### 3. Managing Task Lists

```bash
# Regular progress checks
/dev:list-tasks

# Review and adjust as needed
/dev:list-prds

# Clean up when complete
/dev:cleanup
```

### 4. Quality Assurance

```bash
# Always review generated PRDs before proceeding
# Adjust scope or requirements as needed
# Test implementations thoroughly
# Use version control effectively
```

## Common Patterns and Templates

### Web Application Feature Template

```bash
/dev:create-prd "Add [FEATURE_NAME] to web application with [KEY_COMPONENTS], [INTEGRATION_POINTS], and [TESTING_REQUIREMENTS]"
```

### API Endpoint Template

```bash
/dev:create-prd "Implement [ENDPOINT_PURPOSE] API with [HTTP_METHOD], [AUTHENTICATION], [VALIDATION], and [ERROR_HANDLING]"
```

### Database Schema Template

```bash
/dev:create-prd "Design database schema for [ENTITY_TYPE] with [RELATIONSHIPS], [INDEXES], [CONSTRAINTS], and [MIGRATION_STRATEGY]"
```

---

## Getting Help

If you encounter issues with these examples or need clarification:

1. Check the [main documentation](./README.md)
2. Review [troubleshooting section](./README.md#troubleshooting)
3. Start a [GitHub Discussion](https://github.com/shrwnsan/clix-dev-flow/discussions)
4. Check the [AGENTS.md](./AGENTS.md) for AI interaction guidelines

## Contributing Examples

Have you created useful examples with Dev Flow? Consider contributing them to this documentation to help other users!

---

**Remember**: These examples are starting points. Adapt them to your specific project needs, requirements, and constraints. The strength of Dev Flow is in its flexibility to adapt to various development scenarios.