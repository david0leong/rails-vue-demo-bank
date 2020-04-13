export const required = field => v => !!v || `${field} is required.`
export const email = field => v =>
  /.+@.+\..+/.test(v) || `${field} must be valid email`

export const greaterThan = (field, min) => v =>
  v > min || `${field} must be greater than ${min}`
