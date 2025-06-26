# Complete Momentum Stock Screener - Quick Setup

## Step 1: Create Project Directory

```bash
mkdir momentum-screener
cd momentum-screener
```

## Step 2: Create package.json

```json
{
  "name": "momentum-stock-screener",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "next": "14.0.4",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "recharts": "^2.10.3",
    "lucide-react": "^0.303.0",
    "axios": "^1.6.5"
  },
  "devDependencies": {
    "autoprefixer": "^10.4.16",
    "postcss": "^8.4.33",
    "tailwindcss": "^3.4.0"
  }
}
```

## Step 3: Install Dependencies

```bash
npm install
```

## Step 4: Create Project Structure

Create these directories:
```bash
mkdir pages pages/api components styles public
```

## Step 5: Create Configuration Files

### Create `next.config.js`:
```javascript
/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
}

module.exports = nextConfig
```

### Create `tailwind.config.js`:
```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

### Create `postcss.config.js`:
```javascript
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
```

### Create `.gitignore`:
```
node_modules
.next
.env.local
.vercel
```

## Step 6: Create Main Application Files

### Create `styles/globals.css`:
```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

### Create `pages/_app.js`:
```javascript
import '../styles/globals.css'

export default function App({ Component, pageProps }) {
  return <Component {...pageProps} />
}
```

### Create `pages/index.js`:
```javascript
import MomentumScreener from '../components/MomentumScreener'

export default function Home() {
  return <MomentumScreener />
}
```

### Create `pages/api/market-data.js`:
```javascript
export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ message: 'Method not allowed' });
  }

  // Mock data for demonstration
  const mockData = [
    {
      symbol: 'SOUN',
      name: 'SoundHound AI Inc.',
      price: 9.57,
      change: 2.35,
      changePercent: 32.5,
      volume: 125000000,
      avgVolume: 25000000,
      marketCap: 2850000000,
      peRatio: -8.5,
      week52High: 10.25,
      week52Low: 1.62,
      changePercent20D: 28.5,
      changePercent252D: 143.0,
      shortInterest: 18.5,
      shortRatio: 3.2,
      rsi: 68,
      hasUpcomingEarnings: false,
      earningsDate: '2025-08-15',
      sector: 'Technology'
    },
    {
      symbol: 'HOOD',
      name: 'Robinhood Markets Inc.',
      price: 82.75,
      change: 3.25,
      changePercent: 4.09,
      volume: 18500000,
      avgVolume: 15000000,
      marketCap: 72000000000,
      peRatio: 28.5,
      week52High: 85.00,
      week52Low: 21.34,
      changePercent20D: 15.2,
      changePercent252D: 285.0,
      shortInterest: 12.3,
      shortRatio: 2.1,
      rsi: 72,
      hasUpcomingEarnings: true,
      earningsDate: '2025-07-28',
      sector: 'Finance'
    },
    {
      symbol: 'ENPH',
      name: 'Enphase Energy Inc.',
      price: 41.88,
      change: 4.23,
      changePercent: 11.24,
      volume: 32000000,
      avgVolume: 12000000,
      marketCap: 5600000000,
      peRatio: 45.2,
      week52High: 89.54,
      week52Low: 35.22,
      changePercent20D: 11.3,
      changePercent252D: -15.2,
      shortInterest: 22.1,
      shortRatio: 4.5,
      rsi: 55,
      hasUpcomingEarnings: false,
      earningsDate: '2025-07-30',
      sector: 'Energy'
    },
    {
      symbol: 'SOFI',
      name: 'SoFi Technologies Inc.',
      price: 16.08,
      change: 0.85,
      changePercent: 5.58,
      volume: 65000000,
      avgVolume: 45000000,
      marketCap: 15200000000,
      peRatio: -12.5,
      week52High: 17.84,
      week52Low: 6.21,
      changePercent20D: 8.9,
      changePercent252D: 145.0,
      shortInterest: 14.7,
      shortRatio: 2.8,
      rsi: 61,
      hasUpcomingEarnings: true,
      earningsDate: '2025-07-29',
      sector: 'Finance'
    },
    {
      symbol: 'NKE',
      name: 'Nike Inc.',
      price: 60.83,
      change: -0.42,
      changePercent: -0.69,
      volume: 12000000,
      avgVolume: 10000000,
      marketCap: 92000000000,
      peRatio: 22.5,
      week52High: 78.43,
      week52Low: 58.21,
      changePercent20D: 3.2,
      changePercent252D: -18.5,
      shortInterest: 8.5,
      shortRatio: 3.1,
      rsi: 48,
      hasUpcomingEarnings: true,
      earningsDate: '2025-06-26',
      sector: 'Consumer'
    }
  ];

  res.status(200).json({ data: mockData });
}
```

### Create `components/MomentumScreener.js`:
Copy the complete component code from the previous artifact.

## Step 7: Run Locally

```bash
npm run dev
```

Visit http://localhost:3000

## Step 8: Deploy to Vercel

### Option A: Deploy via Vercel CLI
```bash
npm i -g vercel
vercel
```

### Option B: Deploy via GitHub
1. Push to GitHub:
```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin YOUR_GITHUB_REPO_URL
git push -u origin main
```

2. Go to vercel.com
3. Import your GitHub repository
4. Deploy!

## Troubleshooting 404 Errors

If you get a 404 error:

1. **Local Development**: Make sure you're running `npm run dev` and accessing `http://localhost:3000`

2. **Vercel Deployment**: 
   - Check the Vercel dashboard for build errors
   - Ensure all files are properly committed to GitHub
   - Check that the build command is `npm run build`
   - Verify the output directory is `.next`

3. **Common Fixes**:
   ```bash
   # Clear cache and rebuild
   rm -rf .next node_modules
   npm install
   npm run build
   npm run start
   ```

## Quick One-Line Setup

For the fastest setup, run these commands:

```bash
# Create project
npx create-next-app@latest momentum-screener --no-typescript --tailwind --no-app --no-src-dir --import-alias "@/*"

# Navigate to project
cd momentum-screener

# Install additional dependencies
npm install recharts lucide-react axios

# Start development server
npm run dev
```

Then just copy the component code into `components/MomentumScreener.js` and update `pages/index.js` to import it.
