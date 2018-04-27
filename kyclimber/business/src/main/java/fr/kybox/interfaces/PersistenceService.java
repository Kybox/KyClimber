package fr.kybox.interfaces;

import java.util.List;

public interface PersistenceService<K, E> {

    E findById(K id);
    E merge(E entity);
    List<E> findAll();
    E persist(E entity);
    boolean remove(E entity);
}
