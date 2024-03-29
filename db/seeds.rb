# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Interview.destroy_all
InterviewQuestion.destroy_all
Answer.destroy_all
Question.destroy_all
User.destroy_all

questions = [
  "Explain the difference between inline, block, and inline-block elements in HTML and how they affect layout.",
  "What are pseudo-classes in CSS? Can you provide examples of how they are used?",
  "Describe the box model in CSS and explain its components.",
  "What is the purpose of the CSS 'float' property? How does it work, and what are its drawbacks?",
  "How do you center an element horizontally and vertically in CSS?",
  "What are media queries in CSS, and how do they enable responsive design?",
  "Explain the purpose of the HTML 'data-' attribute and provide an example of how you might use it.",
  "Describe the concept of event delegation in JavaScript and why it's useful.",
  "How do you add and remove classes from an HTML element using JavaScript?",
  "What is the difference between '==' and '===' in JavaScript?",
  "Explain the concept of closures in JavaScript and provide an example of how you might use them.",
  "Describe the difference between synchronous and asynchronous JavaScript code execution.",
  "What is the purpose of the 'async' and 'defer' attributes in the <script> tag?",
  "How do you handle errors in JavaScript, and what are some common error types?",
  "Describe the purpose of the JavaScript 'this' keyword and how its value is determined.",
  "What are arrow functions in JavaScript, and how do they differ from regular functions?",
  "Explain the concept of hoisting in JavaScript and provide an example.",
  "What is the Document Object Model (DOM) in the context of web development?",
  "Describe the process of making an AJAX request in JavaScript.",
  "How do you optimize the performance of a web page, particularly in terms of loading speed and rendering?",
  "What is the event loop in JavaScript, and how does it handle asynchronous operations?",
  "Describe the differences between 'var,' 'let,' and 'const' in JavaScript, and when you would use each.",
  "Explain the concept of prototypal inheritance in JavaScript, and how it differs from classical inheritance.",
  "How do you implement a deep copy of an object in JavaScript?",
  "Describe the purpose of the JavaScript 'spread' operator, and provide examples of how you might use it.",
  "What are higher-order functions in JavaScript, and how do they enable functional programming?",
  "Explain the concept of 'lexical scope' in JavaScript, and how it affects variable resolution.",
  "Describe the difference between 'async' and 'defer' attributes in the <script> tag, and when you would use each.",
  "How do you implement a debounce function in JavaScript, and why might you use it?",
  "Explain the purpose of the JavaScript 'module' pattern, and how it helps encapsulate code.",
  "What are the differences between 'null,' 'undefined,' and 'NaN' in JavaScript?",
  "Describe the concept of 'currying' in JavaScript, and provide an example of how you might use it.",
  "How do you handle asynchronous errors in JavaScript when using promises or async/await?",
  "Explain the concept of 'strict mode' in JavaScript, and how you enable it.",
  "Describe the purpose of the JavaScript 'Symbol' data type, and provide an example of its usage.",
  "What are generators in JavaScript, and how do they differ from regular functions?",
  "How do you implement object cloning in JavaScript using the 'Object.assign' method?",
  "Explain the concept of 'event delegation' in JavaScript, and why it's useful.",
  "What are the differences between 'shallow copy' and 'deep copy' of an object in JavaScript?",
  "What are the benefits of using the 'use strict' directive in JavaScript code?",
  "Describe the purpose and usage of the <meta> tag in HTML, particularly in relation to SEO and viewport settings.",
  "What is the CSS specificity hierarchy, and how does it determine which styles are applied to an element?",
  "Describe the difference between absolute, relative, fixed, and sticky positioning in CSS.",
  "How do you implement a CSS grid layout, and what are its advantages over other layout methods?",
  "Explain the purpose of the CSS 'z-index' property and how it affects the stacking order of elements.",
  "What is the difference between a CSS framework and a CSS preprocessor like Sass or Less?",
  "Describe the purpose of the 'localStorage' and 'sessionStorage' objects in JavaScript, and how they differ from each other.",
  "How do you handle cross-origin resource sharing (CORS) issues in JavaScript when making AJAX requests?",
  "Explain the concept of event bubbling and event capturing in JavaScript, and how they differ.",
  "What is a callback function in JavaScript, and why are they commonly used in asynchronous programming?",
  "Describe the difference between 'var,' 'let,' and 'const' in JavaScript, and when you would use each.",
  "Explain the purpose of the JavaScript 'map,' 'filter,' and 'reduce' array methods, and provide examples of each.",
  "How do you implement form validation in HTML5 without using JavaScript?",
  "Describe the purpose of the HTML <canvas> element and how you can use it to draw graphics and animations.",
  "What are web components in modern web development, and how do they differ from traditional HTML elements?",
  "Explain the concept of progressive enhancement in web development and its benefits.",
  "How do you implement lazy loading of images in a web page to improve performance?",
  "Describe the purpose of the 'role' attribute in HTML and its importance for web accessibility.",
  "What are the benefits of using a task runner like Gulp or Grunt in front-end development workflows?",
  "How do you implement client-side routing in a single-page application (SPA) using JavaScript frameworks like React or Vue.js?",
  "Describe the purpose and usage of the CSS 'animation' property, including keyframes and timing functions.",
  "What are CSS preprocessors, and why are they commonly used in front-end development?",
  "Describe the benefits of using a CSS reset or normalize stylesheet in web development.",
  "How do you implement a sticky header or footer in a webpage using CSS?",
  "Explain the difference between a CSS selector and a pseudo-element.",
  "Describe the purpose of the HTML5 <video> and <audio> elements, and how you can use them to embed multimedia content.",
  "What are web fonts, and how do you use them to enhance typography on a webpage?",
  "How do you optimize images for the web to improve page load times and performance?",
  "Describe the purpose of the HTML 'lang' attribute and its importance for internationalization and accessibility.",
  "What is the difference between 'null' and 'undefined' in JavaScript, and when you would use each?",
  "How do you implement asynchronous programming in JavaScript using callbacks, promises, and async/await?",
  "Describe the difference between 'let' and 'const' declarations in JavaScript, and when you would use each.",
  "What are modules in JavaScript, and how do you use them to organize and structure your code?",
  "How do you implement a debounce function in JavaScript, and what problem does it solve?",
  "How do you handle errors in JavaScript using try-catch blocks, and what are some best practices for error handling?",
  "Describe the concept of 'event bubbling' and 'event capturing' in JavaScript, and how they relate to the event propagation model.",
  "What are arrow functions in JavaScript, and how do they differ from regular function expressions?",
  "How do you implement object cloning in JavaScript using the 'Object.assign' method?",
  "Describe the concept of 'destructuring' in JavaScript, and provide examples of how you might use it with arrays and objects.",
  "How do you implement a debounce function in JavaScript, and what problem does it solve?",
  "What is the purpose of the JavaScript 'use strict' directive, and how does it affect the behavior of your code?",
  "Describe the concept of 'lexical scope' in JavaScript, and how it affects variable resolution.",
  "How do you handle asynchronous errors in JavaScript when using promises or async/await?",
  "Explain the concept of 'strict mode' in JavaScript, and how you enable it.",
  "What are generators in JavaScript, and how do they differ from regular functions?",
  "Explain the concept of 'event delegation' in JavaScript, and why it's useful.",
  "Describe the purpose of the HTML <script> tag attributes 'defer' and 'async,' and when you would use each.",
  "How do you implement a toggle switch or checkbox in HTML and CSS with custom styles?",
  "Explain the purpose of the CSS 'transform' property and provide examples of its usage for 2D and 3D transformations.",
  "What are web accessibility best practices, and how do you ensure your websites are accessible to users with disabilities?",
  "Describe the purpose of the HTML 'lang' attribute and its importance for internationalization and accessibility.",
  "What are the advantages and disadvantages of using inline styles in HTML compared to external CSS files?",
  "Explain the concept of state management in front-end frameworks like React and how it differs from traditional JavaScript applications.",
  "Describe the purpose of the HTML <script> tag attributes 'defer' and 'async,' and when you would use each.",
  "How do you optimize images for the web to improve page load times and performance?",
  "Describe the purpose of the HTML 'lang' attribute and its importance for internationalization and accessibility.",
  "What are web accessibility best practices, and how do you ensure your websites are accessible to users with disabilities?",
  "Describe the purpose of the HTML5 <video> and <audio> elements, and how you can use them to embed multimedia content."
];


demo_questions = ["What is the CSS specificity hierarchy, and how does it determine which styles are applied to an element?", "Explain the purpose of the CSS ‘z-index’ property and how it affects the stacking order of elements", "What is a callback function in JavaScript, and why are they commonly used in asynchronous programming?"]

  demo_questions.each do |question|
    Question.create(content: question, category: "technical", role: "Front end", language: "JS")
  end
