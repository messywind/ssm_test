package com.qst.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Result {
    private int bookID;
    private String bookName;
    private String bookDetail;
    private String bookStatus;
}
