/**
 * Works like a standard Map, but throws an error if the key is not found
 * with a list of valid keys. Useful for debugging typos in test code.
 *
 * @param {any} key:K
 * @returns {any}
 */
export class SmartMap<K, V> extends Map<K, V> {
  get(key: K): V {
    if (!this.has(key)) {
      const validKeys = Array.from(this.keys()).join(", ");
      throw new Error(
        `Key not found: ${String(key)}. Valid keys are: ${validKeys}`
      );
    }
    return super.get(key)!;
  }
}
