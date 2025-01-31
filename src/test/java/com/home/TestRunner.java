package com.home;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:com/home/features").relativeTo(getClass());
    }
}