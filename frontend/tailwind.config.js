module.exports = {
  content: [
    "./src/**/*.{vue,js,ts}",
  ],
  theme: {
    screens: {
      'sm': '640px',
      'md': '768px',
      'lg': '1024px',
      'xl': '1280px',
      '2xl': '1536px'
    },
    colors: {
      "transparent": "transparent",
      "white": "#FFFFFF",
      "white2": "#F7F7F7",
      "purple": "#7061E4",
      "purple2": "#8A6CDF",
      "black": "#000000",
      "glass-black": "rgba(0, 0, 0, 0.2)",
      "light-grey": "#C5C5C5",
      "dark-grey": "#4D4D4D",
      "success": "#12eb7c",
      "error": "#f54242",
      "server-error": "#f5b342",
      "info": "#42c3f5",
    },
    fontFamily: {
      sans: ['Palanquin', 'sans-serif']
    },
    borderRadius: {
      'none': '0',
      'sm': '8px',
      DEFAULT: '11px'
    },
    extend: {
      boxShadow: {
        'md': '0px 0px 8px rgba(0, 0, 0, 0.25)',
        "sm": "0px 2px 5px -3px rgba(0, 0, 0, 0.25)"
      },
      transitionTimingFunction: {
        DEFAULT: 'ease-in-out',
      },
      transitionDuration: {
        DEFAULT: '0.4s',
      }
    }
  },
  plugins: [],
}
