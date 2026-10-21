# Task 3 - OOP in Ruby

This solution demonstrates how OOP works in Ruby. The class `LibraryItem` has three children: `Book`, `DVD`, and `CD`. `LibraryItem` has some general properties and the children have some specific properties. The `Library` class aggregates different library items using polymorphism. The demonstration code (the top-level statements after the class declarations) was taken from the assignment description on Blackboard. I only modified the parameters in class declarations.

To run this code, make sure to have `ruby` installed on your machine and use the following command:

```bash
ruby main.rb
```

Alternatively, you can use an online environment like OnlineGDB (https://onlinegdb.com/o3-I8PrcG) or another similar resource.

## Notes on the Implementation

I added several new properties to child classes that were not mentioned in the assignment description. You can easily see them in the code.

The `display_info` method defined in `LibraryItem` and then overridden in each child class prints all of the corresponding class's properties in a neat and compact way identically to [how Rust does it](https://doc.rust-lang.org/std/fmt/trait.Debug.html).

## Output Explanation

The program's output:

```
Book { title: "Concepts of Programming Languages", author: "Robert Sebesta", publication_year: "2015", isbn: "978-1-56619-909-4", genre: "Programming", page_count: "776" }
DVD { title: "Inception", author: "Christopher Nolan", publication_year: "2010", length_mins: "148" }
CD { title: "A Day at the Races", author: "Queen", publication_year: "1976", record_label: "Elektra Records", length_secs: "2664" }

Book { title: "Concepts of Programming Languages", author: "Robert Sebesta", publication_year: "2015", isbn: "978-1-56619-909-4", genre: "Programming", page_count: "776" }
DVD { title: "Inception", author: "Christopher Nolan", publication_year: "2010", length_mins: "148" }
CD { title: "A Day at the Races", author: "Queen", publication_year: "1976", record_label: "Elektra Records", length_secs: "2664" }
```

The demo first instantiates three object corresponding to each child class. It then calls the `display_info` method on each, which corresponds to the first three lines of the output.

After this, the demo code instantiates a `Library` and puts the above mentioned objects into it. It then calls `display_all_items` on it, which goes through the list of objects and calls `display_info` on each. We see polymorphism implemented here, because the correct overridden behavior of `display_info` is used for each object, despite the fact that three different classes are lumped together inside `Library`. All of this corresponds to the last three lines of the output.
