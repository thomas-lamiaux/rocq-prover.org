const defaultTheme = require("tailwindcss/defaultTheme")

const figma_colors = {
    primary: "#260085",
    primary_40: "#3A00CC",
    primary_25: "#B0BEFF",
    primary_dark: "#170052",
    primary_nav_block_hover_10:"#f0dad1",

    secondary: "#FF540A",
    secondary_25: "#FF7E47",
    secondary_bt_hover: "#FF7033",

    tertiary: "#c9c2ba",
    tertiary_lighter: "#c9c9c9",
    tertiary_25: "#c9c9c940",
    tertiary_bt_hover: "#aaa5a3",
    tertiary_blue_hover: "#aaa5a3",

    title: "#260085",
    content: "#303030",

    separator_20: "#00000033",
    card_border: "#00000033",
    white: "#FFFFFF",
    light:"#FCFCFC",
    mild_blue: "#260085",

    background: "white",
    sand: "#ededed",
    code_window: "#2B2A2A",

    search_keyboard_cursor:"#0C3B8C",
    search_term_highlight:"#F36528",

    dark: {
      primary: "#fd530b",
      primary_40: "#ff540a66",
      primary_20: "#ff540a33",
      primary_10: "#ff540a19",
      primary_nav_block_hover_10:"#fd530b1A",

      secondary: "#260085",
      secondary_bt_hover: "#4912d3",
      secondary_bt_pressed: "#5227be",

      tertiary: "#007AD0",
      tertiary_lighter: "#007BC7",
      tertiary_bt_hover: "#111827",
      white:"#FFFFFF",

      title: "#FFFFFFDE",
      content: "#FFFFFF99",
      card_hover: "#2B2A2A",
      card: "#121321",

      separator_30: "#FFFFFF4D",
      background: "#050610", 
      background_navigation: "#070608",
      code_window: "#2B2A2A",    
    }
}

module.exports = {
  content: ["**/*.eml"],
  darkMode: 'class',
  theme: {
    screens: {
      'sm': '40em',
      'md': '48em',
      'lg': '64em',
      'xl': '80em',
    },
    extend: {
      typography: (theme) => ({
        DEFAULT: {
          css: [{
            'code::before': {
              content: '""',
            },
            'code::after': {
              content: '""',
            },
          },{
            'p':{
              color: theme('colors.content'),
            },
            'strong': {
              color: theme('colors.title'),
            },
            h1: {
              color: theme('colors.title'),
              fontWeight: 700,
            },
            'h2, h3, h4, h5, h6, code': {
              color: theme('colors.title'),
            },
            code: {
              fontSize: "1em",
            },
            'h2 code': {
              fontSize: "1em",
            },
            'h3 code': {
              fontSize: "1em",
            },
            a: {
              color: theme('colors.primary'),
              textDecoration: "none",
            },
            'a:hover': {
              textDecoration: "underline",
            },
            pre: {
              backgroundColor: theme('colors.code_window'),
            },
            'pre > code': {
              color: theme('colors.white'),
            }
          },{
            '--tw-prose-bullets': figma_colors.content,
            '--tw-prose-invert-bullets': figma_colors.dark.content,
          }]
          
        },
        invert: {
          css: {
            'p, li, a > span':{
              color: theme('colors.dark.content'),
            },
            a: {
              color: theme('colors.dark.white'),
              textDecoration:'underline',
            },
            'a:hover': {
              color: theme('colors.dark.primary'),
            },
            h1: {
              color: theme('colors.dark.title'),
            },
            'h2, h3, h4, h5, h6, code': {
              color: theme('colors.dark.title'),
            },
            pre: {
              backgroundColor: theme('colors.dark.code_window'),
            },
            'pre > code, strong': {
              color: theme('colors.dark.title'),
            },
          },
        }
      }),
      boxShadow:{
        '3xl':'rgba(0, 0, 0, 0.35) 0px 5px 15px',
      },
      maxWidth: {
        '8xl': '90rem',
      },
      fontFamily: {
        sans: ["Instrument Rocq", ...defaultTheme.fontFamily.sans],
        mono: ["Source Code Pro", ...defaultTheme.fontFamily.mono]
      },
      colors: {
        ...figma_colors,
      },
      borderColor: {
        DEFAULT: "#00000020"
      },
      backgroundColor: {
        avatar: {
          0: "#15004c",
          1: "#ffa27a",
          2: "#1c0066",
          3: "#ff7b43",
          4: "#15004c",
          5: "#702100",
          6: "#15004c",
          7: "#ff540a",
          8: "#d23f00",
          9: "#3958ff",
          10: "#a63200",
          11: "#ff7b43"
        },
        event:{
          0: "#15004c",
          1: "#1c0066",
          2: "#a63200",
          3: "#ff7b43",
          4: "#702100",
          5: "#ff540a"
        },

        code: {
          background: "rgba(13, 13, 13, 1)",
        },
      },
      boxShadow: {
        'custom': '0 4px 8px rgba(255, 84, 10, 0.5)'
      },

      clipPath: {
        'triangle-1': 'polygon(0 0, 100% 0, 0 100%)',
        'triangle-2': 'polygon(100% 100%, 100% 0, 0 100%)',
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/aspect-ratio"),
    function ({ addUtilities }) {
      const newUtilities = {
        '.clip-triangle': {
          clipPath: 'polygon(100% 100%, 100% 0, 0 100%)',
        },

        '.truncate-2-lines': {
          display: '-webkit-box',
          '-webkit-line-clamp': '2',
          '-webkit-box-orient': 'vertical',
          overflow: 'hidden',
        },
      }
      addUtilities(newUtilities, ['responsive', 'hover'])
    }
  ],
  safelist: [
    'bg-avatar-0',
    'bg-avatar-1',
    'bg-avatar-2',
    'bg-avatar-3',
    'bg-avatar-4',
    'bg-avatar-5',
    'bg-avatar-6',
    'bg-avatar-7',
    'bg-avatar-8',
    'bg-avatar-9',
    'bg-avatar-10',
    'bg-avatar-11',
    'bg-event-0',
    'bg-event-1',
    'bg-event-2',
    'bg-event-3',
    'bg-event-4',
    'bg-event-5',
  ],
};