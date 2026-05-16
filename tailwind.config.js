/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/**/*.{js,jsx,ts,tsx}',
    './components/**/*.{js,jsx,ts,tsx}',
    './features/**/*.{js,jsx,ts,tsx}',
  ],
  presets: [require('nativewind/preset')],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        // Core dark system
        black: '#000000',
        surface: {
          DEFAULT: '#0A0A0A',
          raised: '#111111',
          elevated: '#1A1A1A',
          overlay: '#242424',
        },
        // Text hierarchy
        text: {
          primary: '#F5F5F5',
          secondary: '#A0A0A0',
          tertiary: '#606060',
          muted: '#3A3A3A',
        },
        // Accent system
        accent: {
          DEFAULT: '#E8E0D0',
          warm: '#D4C5A9',
          gold: '#C9A84C',
          blue: '#4A90D9',
        },
        // Semantic
        border: {
          DEFAULT: '#1E1E1E',
          subtle: '#161616',
          strong: '#2E2E2E',
        },
        error: '#FF453A',
        success: '#32D74B',
        warning: '#FFD60A',
      },
      fontFamily: {
        sans: ['System'],
        display: ['System'],
      },
      borderRadius: {
        '4xl': '32px',
        '5xl': '40px',
      },
      spacing: {
        safe: '16px',
        section: '24px',
      },
    },
  },
  plugins: [],
};
