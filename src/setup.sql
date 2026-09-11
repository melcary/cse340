-- ========================================
-- Organization Table
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- ========================================
-- Insert sample data: Organizations
-- ========================================
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

CREATE TABLE service_project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    project_date DATE NOT NULL,

    CONSTRAINT fk_project_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization(organization_id)
);

INSERT INTO service_project
    (organization_id, title, description, location, project_date)
VALUES
-- BrightFuture Builders
(1,
 'Community Park Renovation',
 'Renovation of a neighborhood park including new benches, walking paths, and recreational areas for local families.',
 'San Diego Community Park',
 '2026-03-15'),
 
 (1,
 'Affordable Housing Repair',
 'Repair and improvement project focused on providing safer and more sustainable homes for low-income families.',
 'Eastside Neighborhood',
 '2026-04-10'),
 
 (1,
 'Green School Construction',
 'Construction of environmentally friendly classrooms using sustainable materials and energy-efficient systems.',
 'Lincoln Elementary School',
 '2026-05-22'),
 
(1,
 'Community Garden Pavilion',
 'Construction of a covered pavilion and gathering space for a community garden and neighborhood activities.',
 'Riverside Community Garden',
 '2026-06-14'),

(1,
 'Neighborhood Walking Trail',
 'Development of a safe walking trail with lighting, benches, and landscaping for residents.',
 'Maplewood Neighborhood',
 '2026-07-18'),

 -- GreenHarvest Growers
(2,
 'Urban Vegetable Garden',
 'Creation of an urban vegetable garden where residents can grow fresh produce and learn sustainable farming techniques.',
 'Downtown Community Center',
 '2026-03-20'),

(2,
 'School Garden Program',
 'Development of a school garden to teach students about agriculture, nutrition, and environmental sustainability.',
 'Jefferson Middle School',
 '2026-04-17'),

(2,
 'Community Greenhouse',
 'Construction of a shared greenhouse that allows local residents to grow vegetables throughout the year.',
 'Northside Community Farm',
 '2026-05-09'),

(2,
 'Neighborhood Composting Project',
 'Community composting initiative designed to reduce food waste and produce natural fertilizer for local gardens.',
 'Oak Street Community Center',
 '2026-06-06'),

(2,
 'Fresh Food Education Fair',
 'Educational event teaching families about healthy food choices, urban farming, and sustainable agriculture.',
 'Central City Plaza',
 '2026-07-25'),

-- UnityServe Volunteers
(3,
 'Food Bank Volunteer Day',
 'Volunteer event supporting the preparation, organization, and distribution of food packages to families in need.',
 'Central Food Bank',
 '2026-03-28'),

(3,
 'Senior Center Support',
 'Volunteer project providing companionship, recreational activities, and assistance to senior citizens.',
 'Sunrise Senior Center',
 '2026-04-25'),

(3,
 'Neighborhood Cleanup',
 'Community cleanup event focused on removing litter and improving public spaces in local neighborhoods.',
 'Westside Neighborhood',
 '2026-05-30'),

(3,
 'Clothing Donation Drive',
 'Collection and distribution of clothing donations to families and individuals experiencing financial difficulties.',
 'Unity Community Center',
 '2026-06-27'),

(3,
 'Back-to-School Volunteer Program',
 'Volunteer initiative providing school supplies and educational support to children before the new school year.',
 'Hope Community Center',
 '2026-08-08');

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE project_category (
    project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,

    PRIMARY KEY (project_id, category_id),

    CONSTRAINT fk_project_category_project
        FOREIGN KEY (project_id)
        REFERENCES service_project(project_id),

    CONSTRAINT fk_project_category_category
        FOREIGN KEY (category_id)
        REFERENCES category(category_id)
);

INSERT INTO category (name)
VALUES
('Environment'),
('Community Development'),
('Education');

INSERT INTO project_category (project_id, category_id)
VALUES

-- BrightFuture Builders
(1, 2), -- Community Park Renovation -> Community Development
(1, 1), -- Community Park Renovation -> Environment

(2, 2), -- Affordable Housing Repair -> Community Development

(3, 1), -- Green School Construction -> Environment
(3, 3), -- Green School Construction -> Education

(4, 1), -- Community Garden Pavilion -> Environment
(4, 2), -- Community Garden Pavilion -> Community Development

(5, 1), -- Neighborhood Walking Trail -> Environment


-- GreenHarvest Growers
(6, 1), -- Urban Vegetable Garden -> Environment
(6, 2), -- Urban Vegetable Garden -> Community Development

(7, 1), -- School Garden Program -> Environment
(7, 3), -- School Garden Program -> Education

(8, 1), -- Community Greenhouse -> Environment
(8, 3), -- Community Greenhouse -> Education

(9, 1), -- Neighborhood Composting Project -> Environment
(9, 3), -- Neighborhood Composting Project -> Education

(10, 2), -- Fresh Food Education Fair -> Community Development
(10, 3), -- Fresh Food Education Fair -> Education


-- UnityServe Volunteers
(11, 2), -- Food Bank Volunteer Day -> Community Development

(12, 2), -- Senior Center Support -> Community Development

(13, 1), -- Neighborhood Cleanup -> Environment
(13, 2), -- Neighborhood Cleanup -> Community Development

(14, 2), -- Clothing Donation Drive -> Community Development

(15, 2), -- Back-to-School Volunteer Program -> Community Development
(15, 3); -- Back-to-School Volunteer Program -> Education

