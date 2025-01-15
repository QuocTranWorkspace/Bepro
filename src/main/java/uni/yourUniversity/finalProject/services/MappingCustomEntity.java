package uni.yourUniversity.finalProject.services;

import uni.yourUniversity.finalProject.model.BaseEntity;

/**
 * The interface Mapping custom entity.
 *
 * @param <E> the type parameter
 */
public interface MappingCustomEntity<E extends BaseEntity> {
    /**
     * Convert e.
     *
     * @param data the data
     * @return the e
     */
    public E convert(Object[] data);
}
