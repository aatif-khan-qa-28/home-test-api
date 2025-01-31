package com.home;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:com/home/features/FetchInventory.feature", "classpath:com/home/features/FilterById.feature", "classpath:com/home/features/VerifyRecentlyAddedItem.feature", "classpath:com/home/features/AddItemWithMissingAttributes.feature", "classpath:com/home/features/AddExistentItem.feature").relativeTo(getClass());
    }
}