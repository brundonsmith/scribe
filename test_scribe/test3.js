
class Entity {
  constructor() {
    this.name = '';
    this.health = 0;
    thia.maxHealth = 0;
  }
}

class Player extends Entity {
  constructor() {
    super();
  }
}

class Enemy extends Entity {
  constructor() {
    super();
  }
}

var isDead = (e) => e.health < 1

function myStory(name1, name2) {
  console.log(`Hello, ${name1}! My name is ${name2}.`)
}

myStory("Bob", "Jane")
