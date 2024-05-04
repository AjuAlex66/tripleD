Flutter Developer - TEST
***
Hello and thanks for taking the time to try this out.

The goal of this test is to assert (to some degree) your coding and architectural skills. You're given a simple problem so you can focus on showcasing development techniques. We encourage you to overengineer the solution to show off what you can do - assume you're building a production-ready application that other developers will need to work on and add to over time.

You're **allowed and encouraged** to use third party libraries, as long as you put them together yourself **without relying on a framework or microframework** to do it for you. An effective developer knows what to build and what to reuse, but also how his/her tools work. Be prepared to answer some questions about those libraries, like why you chose them and what other alternatives you're familiar with.

As this is a code review process, please avoid adding generated code to the project. This makes our jobs as reviewers more difficult, as we can't review code you didn't write.

Read all the tasks before start writing code.  Commit changes when each task completed. Source code must have a repository in `bitbucket`, `github`, etc. Once the project completed share the repository URL and source code as zip file. 

## Task - 1
Create a dropdown widget without utilizing plugins or third-party packages.
Dropdown label: More Actions  
List Items: View, Edit, Send, and Delete  
`Delete` text colour is `RED` 

## Task - 2
Develop two select boxes with a dependency: "Country" and "State". Update the options of "State" based on the selected "Country". Utilize the following dataset for Country and State.

Country: IN, US, CA  
States in `IN`: KA, KL, TN and MH  
States in `US`: AL, DE and GA  
States in `CA`: ON, QC and BC

## Task - 3
Write a widget which display name of the user.   
Widget Name: `DisplayName`  
Attributes:
`firstName: String, secondName: String, prefix: String, suffix: String`

Output:` prefix + firstName + secondName + suffix`


## Task - 4
Develop a widget with a userId attribute that displays the profile information of the specified user (userId). The block should showcase the user's email, name, and profile image. Utilize the `DisplayName` widget, created in Task - 3, to showcase the user's name. The data should be loaded from a remote server, specifically using `https://reqres.in/api/users/{userId}` to retrieve user information. While the data is being loaded from the server, display the text "Loading." The layout of the widget should resemble that of `profile-component.png`
Widget Name: `ProfileInfo`  
Attributes:
`userId: Number`

## Task - 5
Develop a straightforward Flutter router that displays user profile data. The user ID is read from the URL, and the `ProfileInfo` widget created in Task - 4 is utilized. 
Url pattern : #/user/{userId}

## Evaluation criteria

These are some aspects we pay particular attention to:

- You **MUST** use packages, but you **MUST NOT** use a web-app framework or microframework.
- You **MUST** write testable code and demonstrate unit testing it.
- You **SHOULD** pay attention to best security practices.
- You **SHOULD** follow SOLID principles where appropriate.

The following earn you bonus points:

- Your answers during code review
- An informative, detailed description in the PR
- Setup with a one liner or a script
- Pagination
- Other types of testing - e.g. integration tests
- A git history (even if brief) with clear, concise commit messages.

---

Good luck!