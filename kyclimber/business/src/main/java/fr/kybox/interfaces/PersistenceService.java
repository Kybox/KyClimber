package fr.kybox.interfaces;

import java.util.List;

public interface PersistenceService<K, E> {

    E findById(K id);
    E save(E entity);
    List<E> findAll();
    boolean remove(E entity);
}
