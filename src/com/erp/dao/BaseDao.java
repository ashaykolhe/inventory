package com.erp.dao;

import com.google.inject.Inject;
import com.google.inject.Provider;
import com.wideplay.warp.persist.Transactional;
import com.erp.dao.IDao;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.FlushMode;

import java.io.Serializable;
import java.util.List;

/**
 *
 * <p>
 * Abstract implementation for data access classes. Extending this class give's
 * us the benefit of generic working find, findAll, save, and remove methods.
 *
 * @param <T>
 * @param <PK>
 */
public class BaseDao<T, PK extends Serializable> implements IDao<T, PK> {

	protected com.google.inject.Provider<Session> sessionProvider;

  @Inject
  public void setSessionProvider(Provider<Session> sessionProvider) {
    this.sessionProvider = sessionProvider;
  }

  private Class<T> persistentClass;

	public BaseDao(Class<T> persistentClass) {
		this.persistentClass = persistentClass;
	}

  public T find(PK id) {
		return (T) sessionProvider.get().get(this.persistentClass, id);
	}

  @SuppressWarnings({"unchecked"})
  public List<T> listAll() {
    Criteria criteria = sessionProvider.get().createCriteria(persistentClass);
    return criteria.list();
  }

  /**
   * The FlushMode has now been set to Manual by default.
   *
   * We set it back to AUTO as soon as a save() or remove() call is made
   *
   * This helps in preventing undesirable behaviour for eg.
   *
   * When a form is submitted and it binds to a persitent object, and if validations fail then still
   * values were being persisted to the DB. Now this will not happen as the flushMode will be manual
   * until a save is called
   *
   * @param object
   * @return
   */
  @Transactional
	public T save(T object) {
    sessionProvider.get().setFlushMode(FlushMode.AUTO);
    return (T) sessionProvider.get().merge(object);
	}

	@Transactional
	public void remove(PK id) {
    Session s = sessionProvider.get();
    s.setFlushMode(FlushMode.AUTO);
    s.delete(s.get(this.persistentClass, id));
	}

  @Transactional
  public void refresh(T t) {
    sessionProvider.get().refresh(t);
  }
}