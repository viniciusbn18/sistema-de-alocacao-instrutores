CREATE TABLE user_roles(
    user_id BIGINT NOT NULL,
    role VARCHAR(50) NOT NULL,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES tb_user(id) ON DELETE CASCADE
);