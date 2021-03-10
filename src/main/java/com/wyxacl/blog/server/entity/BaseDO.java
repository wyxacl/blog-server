package com.wyxacl.blog.server.entity;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * base data object
 *
 * @author wyx
 * @version 1.0
 * @since 2020-01-13 12:11
 */
@Data
public abstract class BaseDO {
    private Long id;
    private LocalDateTime gmtCreate;
    private LocalDateTime gmtModified;
}
