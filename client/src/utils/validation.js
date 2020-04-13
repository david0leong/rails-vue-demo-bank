export const required = field => v => !!v || `${field} is required.`
export const email = field => v =>
  /.+@.+\..+/.test(v) || `${field} must be valid email`
