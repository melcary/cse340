import express from 'express';
import { showHomePage } from './controllers/index.js';
import { showProjectsPage, showProjectDetailsPage, showNewProjectForm, processNewProjectForm,showEditProjectForm, processEditProjectForm, projectValidation} from './controllers/projects.js';
import { showCategoriesPage, showNewCategoryForm,  processNewCategoryForm,  categoryValidation, showCategoryDetailsPage, showAssignCategoriesForm, processAssignCategoriesForm, showEditCategoryForm, processEditCategoryForm } from './controllers/categories.js';
import { testErrorPage } from './controllers/errors.js';
import { showOrganizationsPage, showOrganizationDetailsPage, showNewOrganizationForm, processNewOrganizationForm, organizationValidation, showEditOrganizationForm,  processEditOrganizationForm} from './controllers/organizations.js';

const router = express.Router();

router.get('/', showHomePage);
router.get('/organizations', showOrganizationsPage);
router.get('/projects', showProjectsPage);
router.get('/categories', showCategoriesPage);
router.get('/new-category', showNewCategoryForm);
router.post('/new-category', categoryValidation, processNewCategoryForm);
router.get('/edit-category/:id', showEditCategoryForm);
router.post('/edit-category/:id', categoryValidation, processEditCategoryForm);
router.get('/new-organization', showNewOrganizationForm);
router.post('/new-organization', organizationValidation, processNewOrganizationForm);
router.get('/edit-organization/:id', showEditOrganizationForm);
router.post('/edit-organization/:id', organizationValidation, processEditOrganizationForm);
router.get('/new-project', showNewProjectForm);
router.post('/new-project', projectValidation, processNewProjectForm);
router.get('/assign-categories/:projectId', showAssignCategoriesForm);
router.post('/assign-categories/:projectId', processAssignCategoriesForm);
router.get('/edit-project/:id', showEditProjectForm);
router.post('/edit-project/:id', projectValidation, processEditProjectForm);

// error-handling routes
router.get('/test-error', testErrorPage);

router.get('/organization/:id', showOrganizationDetailsPage);

router.get('/project/:id', showProjectDetailsPage);

router.get('/category/:id', showCategoryDetailsPage);

export default router;