import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    globals: false,
    coverage: {
      reporter: ['lcov'],
    },
    environment: 'node',
    typecheck: {
      tsconfig: './tsconfig.json',
    },
    
  },
})