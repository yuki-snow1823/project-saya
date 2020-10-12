import colors from 'vuetify/es5/util/colors'

require('dotenv').config(); // <- 追加

export default {
  mode: "spa",
  /*
   ** Headers of the page
   */
  head: {
    title: "Saya's Birthday",
    meta: [
      { charset: "utf-8" },
      { name: "viewport", content: "width=device-width, initial-scale=1" },
      {
        hid: "description",
        name: "description",
        content:
          process.env.npm_package_description ||
          "朱鷺戸沙耶のお誕生日を祝うアプリです。"
      },
      { hid: "description", name: "description", content: "サービスの説明" },
      {
        hid: "twitter:card",
        name: "twitter:card",
        content: "summary"
      }, // 画像のタイプ。詳しくは後術。
      { hid: "twitter:site", name: "twitter:site", content: "@magic18jpn" },
      {
        hid: "twitter:image",
        name: "twitter:image",
        content:
          "https://3.bp.blogspot.com/-3CtFNaO7nZQ/VaMNdpSHc8I/AAAAAAAAvYA/qFFLFrGkrjo/s800/girl_13.png"
      }, // 苦労しました。詳しくは後術。
      {
        hid: "og:type",
        property: "og:type",
        content: "blog"
      },
      {
        hid: "og:title",
        property: "og:title",
        content: "Saya's Birthday"
      },
      {
        hid: "og:url",
        property: "og:url",
        content: "https://tokidosaya.com" // デプロイ済みであることが前提です。
      },
      {
        hid: "og:description",
        property: "og:description",
        content:
          "リトルバスターズ！EXの朱鷺戸沙耶の誕生日をお祝いするWebアプリです。ツイートされればされるほどお祝い回数が増えるので、是非使ってみてください。"
      },
      {
        hid: "og:image",
        property: "og:image",
        content:
          "https://3.bp.blogspot.com/-3CtFNaO7nZQ/VaMNdpSHc8I/AAAAAAAAvYA/qFFLFrGkrjo/s800/girl_13.png"
      },
      { hid: "og:site_name", name: "og:site_name", content: "Saya's Birthday" }
    ],
    link: [{ rel: "icon", type: "image/x-icon", href: "/favicon.ico" }]
  },
  /*
   ** Customize the progress-bar color
   */
  loading: { color: "#fff" },
  /*
   ** Global CSS
   */
  css: [],
  /*
   ** Plugins to load before mounting the App
   */
  plugins: ["@/plugins/vue-typer"],
  /*
   ** Nuxt.js dev-modules
   */
  buildModules: ["@nuxtjs/vuetify", "@nuxtjs/dotenv"],
  /*
   ** Nuxt.js modules
   */
  modules: [
    // Doc: https://axios.nuxtjs.org/usage
    "@nuxtjs/axios"
  ],
  /*
   ** Axios module configuration
   ** See https://axios.nuxtjs.org/options
   */
  axios: {},
  /*
   ** vuetify module configuration
   ** https://github.com/nuxt-community/vuetify-module
   */
  vuetify: {
    customVariables: ["~/assets/variables.scss"],
    theme: {
      dark: false,
      themes: {
        dark: {
          primary: colors.blue.darken2,
          accent: colors.grey.darken3,
          secondary: colors.amber.darken3,
          info: colors.teal.lighten1,
          warning: colors.amber.base,
          error: colors.deepOrange.accent4,
          success: colors.green.accent3
        }
      }
    }
  },
  /*
   ** Build configuration
   */
  build: {
    /*
     ** You can extend webpack config here
     */
    extend(config, ctx) {}
  }
};
