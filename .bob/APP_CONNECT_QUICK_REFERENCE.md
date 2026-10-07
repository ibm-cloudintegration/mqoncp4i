# 🔗 IBM App Connect Engineer - Quick Reference

## Common Commands & Patterns

### Message Flow Creation

```
Create a message flow that [describes what it does]
```

**Examples:**
- "Create a message flow that reads from MQ and writes to database"
- "Build a flow that transforms JSON to XML"
- "Design a flow that calls multiple REST APIs"

### REST API Development

```
Create a REST API that [describes functionality]
```

**Examples:**
- "Create a REST API for customer management"
- "Build a REST API that integrates with Salesforce"
- "Design an API with OAuth authentication"

### Data Transformation

```
Transform [source format] to [target format] for [purpose]
```

**Examples:**
- "Transform JSON to XML for legacy system"
- "Convert CSV data to JSON for API consumption"
- "Map customer data between two different schemas"

### Security Configuration

```
Add [security type] to [component]
```

**Examples:**
- "Add OAuth 2.0 to my REST API"
- "Implement JWT authentication"
- "Configure HTTPS with client certificates"

### Troubleshooting

```
[Problem description] is failing with [error]
```

**Examples:**
- "My MQ connection is failing with MQRC 2059"
- "Database insert is throwing SQL error"
- "REST API returns 401 unauthorized"

## Key Concepts

### Message Flow Components

| Component | Purpose | Common Use |
|-----------|---------|------------|
| Input Node | Receive messages | HTTP, MQ, File, Kafka |
| Compute Node | Transform data | ESQL, Java, Mapping |
| Output Node | Send messages | HTTP, MQ, Database, File |
| Route Node | Conditional routing | Content-based routing |
| Try-Catch | Error handling | Exception management |

### ESQL Quick Reference

**Set Variables:**
```sql
SET OutputRoot.JSON.Data.customer.name = InputRoot.JSON.Data.customerName;
```

**Conditional Logic:**
```sql
IF InputRoot.JSON.Data.amount > 1000 THEN
    SET OutputRoot.JSON.Data.priority = 'HIGH';
ELSE
    SET OutputRoot.JSON.Data.priority = 'NORMAL';
END IF;
```

**Database Query:**
```sql
SET result[] = PASSTHRU('SELECT * FROM customers WHERE id = ?', InputRoot.JSON.Data.customerId);
```

**Error Handling:**
```sql
BEGIN
    -- Your logic here
EXCEPTION
    DECLARE errorMsg CHARACTER;
    SET errorMsg = CAST(SQLSTATE AS CHARACTER) || ' - ' || CAST(SQLNATIVEERROR AS CHARACTER);
    THROW USER EXCEPTION MESSAGE 2951 VALUES(errorMsg);
END;
```

### Common Patterns

#### 1. Request-Reply Pattern
```
HTTP Input → Compute (Transform) → HTTP Request → Compute (Response) → HTTP Reply
```

#### 2. Fire-and-Forget Pattern
```
MQ Input → Compute (Process) → Database Output
```

#### 3. Content-Based Routing
```
HTTP Input → Route (by content) → [Multiple Output Paths]
```

#### 4. Aggregation Pattern
```
Multiple Inputs → Aggregate → Compute → Single Output
```

## Configuration Examples

### HTTP Input Node
```
Path: /api/customers
Method: POST
Content-Type: application/json
```

### MQ Input Node
```
Queue Name: CUSTOMER.IN
Queue Manager: QM1
Connection: CLIENT
Host: localhost
Port: 1414
Channel: SYSTEM.DEF.SVRCONN
```

### Database Node
```
Data Source: MYDB
Schema: CUSTOMERS
Table: CUSTOMER_DATA
Operation: INSERT
```

### HTTP Request Node
```
URL: https://api.example.com/customers
Method: POST
Headers: 
  - Content-Type: application/json
  - Authorization: Bearer {token}
```

## Error Handling Patterns

### Basic Try-Catch
```
[Input] → [Try] → [Compute] → [Output]
              ↓
           [Catch] → [Error Handler] → [Error Output]
```

### Retry Logic
```
[Input] → [Try] → [Compute] → [Output]
              ↓
           [Catch] → [Check Retry Count] → [Retry or Error]
```

### Dead Letter Queue
```
[Input] → [Try] → [Process]
              ↓
           [Catch] → [Log Error] → [DLQ Output]
```

## Performance Tips

1. **Minimize Transformations**: Only transform what's necessary
2. **Use Connection Pools**: Configure appropriate pool sizes
3. **Batch Processing**: Process multiple messages together when possible
4. **Async Processing**: Use fire-and-forget for non-critical operations
5. **Caching**: Cache frequently accessed data
6. **Monitoring**: Track message throughput and latency

## Security Checklist

- [ ] Use HTTPS for all external APIs
- [ ] Implement authentication (OAuth, JWT, Basic Auth)
- [ ] Validate all input data
- [ ] Encrypt sensitive data
- [ ] Use secure credential storage
- [ ] Implement rate limiting
- [ ] Log security events
- [ ] Regular security audits

## Deployment Checklist

- [ ] Test in development environment
- [ ] Create BAR file
- [ ] Configure environment-specific properties
- [ ] Deploy to test environment
- [ ] Run integration tests
- [ ] Deploy to production
- [ ] Monitor for errors
- [ ] Document deployment

## Common Issues & Solutions

### Issue: MQ Connection Failed
**Solution:** Check queue manager, channel, host, port, and credentials

### Issue: Database Connection Timeout
**Solution:** Verify connection string, increase timeout, check network

### Issue: REST API 401 Unauthorized
**Solution:** Verify authentication token, check credentials, review security policy

### Issue: Message Transformation Error
**Solution:** Validate input format, check ESQL syntax, review mapping

### Issue: Performance Degradation
**Solution:** Check message size, review transformations, optimize queries

## Useful Commands

### mqsicreatebar (Create BAR file)
```bash
mqsicreatebar -data /workspace -b myapp.bar -a MyApplication
```

### mqsideploy (Deploy BAR file)
```bash
mqsideploy -i localhost -p 4414 -e default -a myapp.bar
```

### mqsireportproperties (View properties)
```bash
mqsireportproperties IB10NODE -e default -o HTTPConnector -r
```

### mqsichangeproperties (Change properties)
```bash
mqsichangeproperties IB10NODE -e default -o HTTPConnector -n httpConnectorPortRange -v 7800,7842
```

## Getting More Help

Ask the mode:
- "How do I [specific task]?"
- "What's the best way to [integration pattern]?"
- "Explain [concept] in App Connect"
- "Debug [specific error]"
- "Optimize [performance issue]"

---

**Quick Tip:** The more specific you are about your requirements, the better the solution you'll get!

**Made with Bob** 🤖