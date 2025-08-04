#!/bin/bash
npm init -y
npm install --save-dev typescript@5.8.3 eslint prettier @typescript-eslint/parser@latest @tsconfig/recommended @typescript-eslint/eslint-plugin@latest eslint-config-google eslint-config-prettier eslint-plugin-prettier
echo "{
  \"extends\": \"@tsconfig/recommended/tsconfig.json\",
  \"compilerOptions\": {
    \"target\": \"ES2022\",
    \"module\": \"ESNext\",
    \"moduleResolution\": \"bundler\",
    \"allowImportingTsExtensions\": true,
    \"noEmit\": true,
    \"strict\": true,
    \"skipLibCheck\": true,
    \"forceConsistentCasingInFileNames\": true
  },
  \"include\": [\"src/**/*\"],
  \"exclude\": [\"node_modules\", \"dist\"]
}" >tsconfig.json
echo "{
  \"extends\": [
    \"google\",
    \"@typescript-eslint/recommended\",
    \"@typescript-eslint/recommended-requiring-type-checking\",
    \"prettier\"
  ],
  \"parser\": \"@typescript-eslint/parser\",
  \"parserOptions\": {
    \"ecmaVersion\": \"latest\",
    \"sourceType\": \"module\",
    \"project\": \"./tsconfig.json\"
  },
  \"plugins\": [\"@typescript-eslint\", \"prettier\"],
  \"rules\": {
    \"prettier/prettier\": \"error\",
    \"@typescript-eslint/no-unused-vars\": \"error\",
    \"require-jsdoc\": \"off\",
    \"valid-jsdoc\": \"off\"
  },
  \"env\": {
    \"node\": true,
    \"es2022\": true
  }
}" >.eslintrc.json
echo "{
  \"semi\": true,
  \"singleQuote\": true,
  \"tabWidth\": 2,
  \"trailingComma\": \"es5\",
  \"bracketSpacing\": false,
  \"arrowParens\": \"avoid\"
}" >.prettierrc.json
new_scripts='{
  "type-check": "tsc --noEmit",
  "lint": "eslint . --ext .ts,.tsx",
  "lint:fix": "eslint . --ext .ts,.tsx --fix",
  "format": "prettier --write \"**/*.{ts,tsx,js,jsx,json,md}\"",
  "format:check": "prettier --check \"**/*.{ts,tsx,js,jsx,json,md}\"",
  "check-all": "npm run type-check && npm run lint && npm run format:check",
  "fix-all": "npm run format && npm run lint:fix && npm run type-check",
  "pre-commit": "npm run fix-all",
  "ci": "npm run check-all"
}'

# Use jq to set the scripts field
jq --argjson new_scripts "$new_scripts" '.scripts = $new_scripts' package.json >tmp.json && mv tmp.json package.json
