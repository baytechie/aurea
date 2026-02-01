# API Configuration

This document describes how the mobile app connects to the Aurea backend.

---

## Production URLs

| Service | URL |
|---------|-----|
| Backend API | `https://api.aureahealth.app` |
| Frontend Web | `https://aureahealth.app` |
| Data Science | `https://datascience.aureahealth.app` |

---

## Configuration File

**Location:** `src/lib/api.ts`

### Environment Toggle

```typescript
// Set to true to use production API even in development
const USE_PRODUCTION_API = true;
```

- `true` (default): Mobile app connects to production API
- `false`: Mobile app connects to local backend

### Local Development URLs

| Platform | Local URL |
|----------|-----------|
| iOS Simulator | `http://127.0.0.1:8000` |
| Android Emulator | `http://10.0.2.2:8000` |
| Physical Device | Use your Mac's IP address |

**Note:** `localhost` doesn't work from simulators/emulators. Use IP addresses instead.

---

## API Endpoints

### Authentication
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/auth/login` | Login with email/password |
| POST | `/auth/signup` | Create new account |
| GET | `/users/me` | Get current user profile |
| PATCH | `/users/me` | Update user profile |

### Ingredients
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/ingredient/search?q={query}` | Search ingredients |
| GET | `/ingredient/{name}` | Get ingredient details |

### Logs
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/logs` | Get all daily logs |
| GET | `/logs/{date}` | Get log by date |
| POST | `/logs` | Create new log |
| DELETE | `/logs/{id}` | Delete a log |

### Insights
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/insights` | Get personalized insights |

### Predictions
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/predictions` | Predict symptoms for ingredients |

---

## Authentication Flow

1. User logs in via `/auth/login` or signs up via `/auth/signup`
2. Backend returns JWT token
3. Token stored in AsyncStorage under key `auth_token`
4. All subsequent requests include `Authorization: Bearer {token}` header
5. On 401 response, token is cleared and user redirected to login

---

## Switching Between Environments

### Use Production API (Default)
```typescript
const USE_PRODUCTION_API = true;
```

### Use Local Backend
```typescript
const USE_PRODUCTION_API = false;
```

Then start local backend:
```bash
cd /Users/bala/aurea/backend
uvicorn app.main:app --reload --port 8000
```

---

## Testing API Connection

```bash
# Check production API health
curl https://api.aureahealth.app/health

# Check local API health
curl http://127.0.0.1:8000/health

# Test search endpoint
curl "https://api.aureahealth.app/ingredient/search?q=sugar"
```

---

## Troubleshooting

### "Network Error" on Simulator
- Verify API is running: `curl https://api.aureahealth.app/health`
- Check `USE_PRODUCTION_API` setting in `api.ts`
- For local dev, use `127.0.0.1` not `localhost`

### 401 Unauthorized
- Token expired - re-login
- Token not stored - check AsyncStorage

### CORS Errors
- CORS only applies to browsers, not native apps
- If testing in web mode, backend needs CORS configured

### Timeout Errors
- Default timeout is 10 seconds
- Check network connectivity
- Backend may be under heavy load
