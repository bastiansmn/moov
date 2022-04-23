module.exports = {
  'env': {
    'browser': true,
    'es2021': true,
    'node': true,
  },
  'extends': [
    'plugin:vue/essential',
  ],
  'parserOptions': {
    'parser': '@typescript-eslint/parser',
    'ecmaVersion': 'esnext',
    'sourceType': 'module',
  },
  'plugins': [
    'vue',
    '@typescript-eslint',
  ],
  'rules': {
    "vue/no-multiple-template-root": "off",
    "vue/multi-word-component-names": "off",
  },
};
