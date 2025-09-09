# Paw_Caelum 

## Overview
Paw_Caelum is a Java web app that connects dog owners and walkers for end-to-end walk coordination—from finding and arranging walks to sharing feedback. It uses session handling to keep users logged in and route them to role-based dashboards, ensuring authenticated, role-aware access. All data is stored in MySQL for fast lookup and clear status updates.


## Table of Content
- [User Flows and Interactions](#user-flows-and-interactions)
- [Built With](#built-with)
- [Getting Start](#getting-start)

  
## User Flows and Interactions
- **Accounts & Role-Based Access**
  - Sign up as **Owner** or **Walker**; login creates a session with user ID and role.
  - Role-specific dashboards surface only the actions each role needs and protect pages behind authentication.

- **Dog Profiles (Owner)**
  - Create, view, edit, and delete dog profiles with photos (name, breed, size, age, notes).
  - Safety checks prevent edits/deletes when a related walk is pending or active, keeping data consistent.

- **Walk Coordination**
  - Owners post new walk requests (price, duration, notes); requests move through clear statuses (Open → Accepted → Completed).
  - Walkers can **accept** exactly one active request at a time and **mark completed** before taking another.

- **Discovery & Filters (Walker)**
  - Browse available dogs and open requests with quick **filters** (e.g., size, price range, ZIP).
  - Designed for fast scanning so walkers can find suitable matches quickly.

- **Favorites (Walker)**
  - Like/unlike dogs to build a personal shortlist.
  - Helps walkers track dogs they prefer to work with.

- **Ratings & Feedback**
  - After a walk completes, Owners leave **1–5 star** ratings and comments.
  - Walkers can view individual feedback and see an **average rating** for reputation building.

- **Messaging**
  - Owners and their assigned walkers can exchange messages; each user has an **inbox** view.
  - Keeps coordination in-app so details don’t get lost.

- **Session & Security**
  - Session handling enables authenticated, role-aware navigation; protected routes require a valid session.
  - **Logout**/timeout clears the session to safeguard accounts.
 
    
## Built With
- **Languages:** Java 17, HTML, CSS, JavaScript, SQL (MySQL)
- **Frameworks:** Servlets & JSP
- **IDE:** Eclipse
- **Server:** [Apache Tomcat 9](https://tomcat.apache.org/download-90.cgi)
- **Build:** Maven (WAR packaging)
  

## Getting Start
### Install and Configure Tools:
- [Eclipse IDE for Enterprise Java and Web Developers](https://www.eclipse.org/downloads/packages/release/2025-06/r/eclipse-ide-enterprise-java-and-web-developers)
- [Apache Tomcat 9](https://tomcat.apache.org/download-90.cgi)
- [MySQL Workbench](https://dev.mysql.com/downloads/workbench/)
- [mysql-connector-j-9.x.x.jar](https://dev.mysql.com/downloads/connector/j/)

### Clone the Project
```bash
git clone https://github.com/ThelNuZaw/Paw_CaelumGit.git
cd Paw_CaelumGit/
```

### Repository Layout
- **SQL files** - SQL scripts for MySQL WorkBench
- **Paw_CaelumFR** - Eclipse project

  
### Database Setup
1. Open MySQL Workbench
2. Create the new connection name and password. Make sure Port is `3306` and username is `root`.
3. In the SCHEMAS panel, right-click -> Create Schema -> name it `Paw_Caelum` -> Apply
4. Open the SQL files under `Paw_Caelum` schema.

### Eclipse + Tomcat Setup
1. **Import as Maven Project**
   - Open Eclipse -> File -> Import -> Mavens -> Existing Maven Projects -> select `Paw_CaelumFR` -> Finish.

2. **Targeted Runtime**
   - Eclipse Preferences -> Server -> Runtime Environments -> Add -> Choose Apache Tomcat version -> Browse to the downloaded Tomcat folder.

3. **Project Facets**
   - Project -> Properties -> Project Facets
     - Java: 17
     - Dynamic Web Module: 3.1
   - Apply and Close
     
4. **Java Build Path**
   - Project -> Properties -> Java Build Path -> Libraries
   - Add External JARs to class path-> Browse to the downloaded `mysql-connector-j-9.x.x.jar` file.
   - Make sure Libraries have 
     - `JRE System Library`
     - `Maven Dependencies`
     - `Server Runtime`
     - `mysql-connector-j-9.x.x.jar`
       
5. **Deployment Assembly**
   - Project -> Properties -> Deployment Assembly
     - Ensure entries:
       - `Maven Dependencies`
       -  `/src/main/webapp`
       -  `/src/main/java`
         
6. **Database Password Change**
   - Make sure to change the existing password with your own database password for JDBC connection.

7. **Run the Project**
   - Window -> Shoe View -> Servers
   - Right-click in Servers -> New -> Server -> pick your Tomcat.
   - Add the project to the server -> Start the server.
     
8. **Open the project in a browser**
   ```bash
   http://localhost:8080/Paw_CaelumWebApp/MainPage.jsp 
   ```
