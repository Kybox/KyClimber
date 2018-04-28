package fr.kybox.interfaces;

/**
 * @author Kybox
 * @version 1.0
 */

/**
 * CRUD Generic data persistence management interface.
 * @param <K> Primary key type (Integer)
 * @param <E> Entity instance
 */
public interface PersistenceService<K, E> {

    /**
     * Find by primary key. Search for an entity of the specified class and primary key.
     * If the entity instance is contained in the persistence context, it is returned from there.
     * @param id The primary key
     * @return The entity instance or null if the entity does not exist
     */
    E findById(K id);

    /**
     * Merge the state of the given entity into the current persistence context.
     * @param entity Entity instance
     * @return The managed instance that the state was merged to
     */
    E merge(E entity);


    /**
     * Make an instance managed and persistent.
     * @param entity Entity instance
     */
    void persist(E entity);

    /**
     * Remove the entity instance.
     * @param entity Entity instance
     */
    void remove(E entity);
}
