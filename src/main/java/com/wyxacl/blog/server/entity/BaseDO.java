package com.wyxacl.blog.server.entity;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public abstract class BaseDO {
    private Long id;
    private LocalDateTime gmtCreate;
    private LocalDateTime gmtUpdate;
}
