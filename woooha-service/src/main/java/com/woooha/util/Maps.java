
package com.woooha.util;

import java.util.HashMap;
import java.util.Map;

/**
 * @author danson.liu
 *
 */
public class Maps {

	public static MapBuilder entry(Object key, Object value) {
		return new MapBuilder(key, value);
	}
	
	public static class MapBuilder {
		private Map<Object, Object> map = new HashMap<Object, Object>();

		public MapBuilder(Object key, Object value) {
			map.put(key, value);
		}
		
		public MapBuilder entry(Object key, Object value) {
			map.put(key, value);
			return this;
		}
		
		@SuppressWarnings("unchecked")
		public <K, V> Map<K, V> get() {
			return (Map<K, V>) map;
		}
		
	}
	
}
