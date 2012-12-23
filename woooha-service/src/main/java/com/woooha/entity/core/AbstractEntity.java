/**
 * File Created at 12-12-21
 *
 * Copyright 2010 dianping.com.
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of
 * Dianping Company. ("Confidential Information").  You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with dianping.com.
 */
package com.woooha.entity.core;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.io.Serializable;

/**
 * TODO Comment of The Class
 *
 * @author danson.liu
 */
public abstract class AbstractEntity implements Serializable {

    protected Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (!AbstractEntity.class.isAssignableFrom(obj.getClass())) {
            return false;
        }
        if (!this.getClass().equals(obj.getClass())) {
            return false;
        }
        AbstractEntity entity = AbstractEntity.class.cast(obj);
        return new EqualsBuilder().append(this.getId(), entity.getId()).isEquals();

    }

    @Override
    public int hashCode() {
        if (this.getId() != null) {
            return this.getId().hashCode();
        } else {
            return super.hashCode();
        }
    }

    /*
     * (non-Javadoc)
     *
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE).append("id",
                this.getId()).append("hashCode", this.hashCode()).toString();
    }

}
