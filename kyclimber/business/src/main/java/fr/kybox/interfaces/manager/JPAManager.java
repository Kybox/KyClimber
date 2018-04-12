package fr.kybox.interfaces.manager;

import javax.persistence.Entity;

public interface JPAManager {

    void persist(Object obj) throws Exception;
    void merge(Entity T) throws Exception;
}
