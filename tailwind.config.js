const defaultTheme = require("tailwindcss/defaultTheme")

const figma_colors = {
    // Color Light Mode https://www.figma.com/file/bSwyo5pUnarg1lquxQxWAE/Design-System-Draft?type=design&node-id=300-2086&mode=design&t=gjqG6OhhB92AFg51-0
    primary: "#260085",
    primary_40: "#3A00CC",
    primary_25: "#500AFF",
    primary_dark: "#170052",
    primary_nav_block_hover_10:"#89B6E6",

    secondary: "#FF540A",
    secondary_25: "#FF7E47",
    secondary_bt_hover: "#FF7033",

    tertiary: "#c9c2ba",
    tertiary_lighter: "#c9c9c9",
    tertiary_25: "#c9c9c940",
    tertiary_bt_hover: "#aaa5a3",
    tertiary_blue_hover: "#aaa5a3",

    title: "#260085",
    content: "#555659",

    separator_20: "#00000033",
    card_border: "#00000033",
    white: "#FFFFFF",
    light:"#FCFCFC",
    mild_blue: "#500AFF",

    background: "white",
    sand: "#ededed",
    code_window: "#0d0d0d",

    search_keyboard_cursor:"#0C3B8C",
    search_term_highlight:"#F36528",

    dark: {
      // Color Dark Mode https://www.figma.com/file/bSwyo5pUnarg1lquxQxWAE/Design-System-Draft?type=design&node-id=300-2170&mode=design&t=gjqG6OhhB92AFg51-0
      primary: "#C24F1E",
      primary_40: "#D5400066",
      primary_20: "#D5400033",
      primary_10: "#D5400019",
      primary_nav_block_hover_10:"#C24F1E1A",

      secondary: "#00838A",
      secondary_bt_hover: "#004039",
      secondary_bt_pressed: "#00231F",

      tertiary: "#007AD0",
      tertiary_lighter: "#007BC7",
      tertiary_bt_hover: "#111827",
      white:"#FFFFFF",

      title: "#FFFFFFDE",
      content: "#FFFFFF99",
      card_hover: "#2B2A2A",
      card: "#1C1C1C",

      separator_30: "#FFFFFF4D",
      background: "#121212", 
      background_navigation: "#070707",
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
          0: "#bb452a",
          1: "#a35829",
          2: "#926229",
          3: "#746e29",
          4: "#367a28",
          5: "#2a7a54",
          6: "#2c786d",
          7: "#2e7587",
          8: "#336db7",
          9: "#6855e3",
          10: "#ad35bc",
          11: "#c62d69"
        },
        event:{
          0: "#F9CC82",
          1: "#F9BD72",
          2: "#F9AE62",
          3: "#F99F52",
          4: "#F99042",
          5: "#FA8654"
        },

        code: {
          background: "rgba(30, 30, 30, 1)",
        },
      },
      boxShadow: {
        'custom': '0 4px 8px rgba(213, 64, 0, 0.5)'
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