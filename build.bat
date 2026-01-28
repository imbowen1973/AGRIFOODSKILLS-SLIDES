@echo off
setlocal enabledelayedexpansion

REM ============================================================
REM Slide Library PoC - Full Folder Scaffold
REM ============================================================

SET ROOT=slide-library
SET COURSE=veterinary-occupational-profiles

echo Creating root folder...
mkdir "%ROOT%" 2>nul
cd "%ROOT%"

REM --- Top-level folders ---
echo Creating top-level structure...
mkdir "courses" 2>nul
mkdir "shared" 2>nul
mkdir "shared\themes" 2>nul
mkdir "shared\css" 2>nul
mkdir "shared\assets" 2>nul
mkdir "shared\assets\images" 2>nul
mkdir "shared\assets\icons" 2>nul

mkdir "scripts" 2>nul
mkdir "scripts\ai" 2>nul
mkdir "scripts\export" 2>nul
mkdir "scripts\index" 2>nul

mkdir "prompts" 2>nul
mkdir "prompts\slide-review" 2>nul
mkdir "prompts\image-suggestions" 2>nul
mkdir "prompts\overlap-detection" 2>nul

mkdir "indexes" 2>nul
mkdir "indexes\embeddings" 2>nul
mkdir "indexes\metadata" 2>nul

mkdir "exports" 2>nul
mkdir "exports\pdf" 2>nul
mkdir "exports\pptx" 2>nul

REM --- GitHub Pages-ready folder ---
REM Put a copy of runnable HTML here later if you want Pages to serve from /docs
mkdir "docs" 2>nul
mkdir "docs\courses" 2>nul
mkdir "docs\shared" 2>nul

REM --- Course scaffold ---
echo Creating course: %COURSE%
mkdir "courses\%COURSE%" 2>nul
mkdir "courses\%COURSE%\assets" 2>nul
mkdir "courses\%COURSE%\assets\images" 2>nul
mkdir "courses\%COURSE%\assets\video" 2>nul
mkdir "courses\%COURSE%\notes" 2>nul
mkdir "courses\%COURSE%\references" 2>nul

REM --- Course files ---
echo Creating course files...

(
echo # Veterinary Occupational Profiles
echo.
echo ## Rationale for New Occupational Profile Selection
echo.
echo ---
echo.
echo ## Emerging Skills Validation
echo.
echo Agreement No: 101183898-EDU-2024-PI-ALL-INNO
echo.
echo ---
echo.
echo ## Occupational Profile: Specialist Veterinary Clinical Educator
echo.
echo ### Role Definition
echo.
echo A veterinary clinician-educator is a practising veterinarian who combines clinical practice with the supervision and education of postgraduate trainees, including new graduates, residents, and interns.
echo.
echo They operate within accredited training programmes, residency schemes, and structured graduate development pathways, ensuring alignment with professional regulatory standards and institutional frameworks.
echo.
echo ### Core Functions
echo.
echo - Oversight of patient care while mentoring learners towards independent clinical mastery
echo - Delivery of structured teaching sessions
echo - Conduct of workplace-based assessments and formal appraisals
echo - Development of inclusive clinical learning environments
echo.
echo ### ESCO and Classification Context
echo.
echo - ESCO classification: Partially exists within "Specialised veterinarian"
echo - Gap: explicit pedagogical and supervisory competencies not captured
echo.
echo ### Skills Need and Evidence Base
echo.
echo - Skills need: Existing and widespread
echo - Evidence:
echo   - 45%% graduate attrition within first two years (FVE, 2024)
echo   - Mentoring programmes associated with 30%% reduction in attrition
echo.
echo ### Strategic Assessment
echo.
echo - Strategic importance: 5 / 5
echo - Scale of impact: 5 / 5
echo - Urgency: 5 / 5
echo - Overall assessment: 5.0 / 5
echo.
echo ---
echo.
echo ## Occupational Profile: Specialist Veterinary Clinical Researcher
echo.
echo ### Role Definition
echo.
echo A veterinary clinician acting as a clinical researcher is a practising veterinarian who combines clinical practice with clinical research activity.
echo.
echo ### Core Functions
echo.
echo - Design, conduct, and oversight of clinical studies involving client-owned animals
echo - Translation of clinical problems into answerable research questions
echo - Development of robust study protocols
echo - Compliance with ethical and regulatory requirements
echo.
echo ### Skills Need and Evidence Base
echo.
echo - Skills need: Emerging (2–3 year horizon)
echo - Evidence:
echo   - EU workforce surveys indicate 60%% of clinical research lacks formal methodology training
echo   - Increasing requirement for practice-based evidence in regulatory submissions
echo - Contested: distinct occupation vs enhanced competency set
echo.
echo ### Strategic Assessment
echo.
echo - Strategic importance: 4 / 5
echo - Scale of impact: 3 / 5
echo - Urgency: 4 / 5
echo - Overall assessment: 3.7 / 5
echo.
echo ---
echo.
echo ## Profiles Not Yet Developed
echo.
echo - Veterinary AI Governance Specialist
echo - Generic AI skills for veterinary professionals
echo - Emerging topics for EU focus group discussion
) > "courses\%COURSE%\slides.md"

REM A simple per-course manifest to support indexing later
(
echo {
echo   "course_id": "%COURSE%",
echo   "title": "Veterinary Occupational Profiles",
echo   "version": "0.1.0",
echo   "language": "en-GB",
echo   "source": "Converted from PowerPoint / working draft",
echo   "tags": ["occupational-profiles","ESCO","skills-foresight"],
echo   "assets": {
echo     "images_dir": "assets/images",
echo     "video_dir": "assets/video"
echo   }
echo }
) > "courses\%COURSE%\course.json"

REM --- Shared CSS placeholder ---
(
echo /* shared/css/custom.css */
echo /* Add branding here (fonts, spacing, logos). */
) > "shared\css\custom.css"

REM --- Root index.html to browse locally (CDN Reveal.js) ---
echo Creating root index.html (local runner)...
(
echo ^<!doctype html^>
echo ^<html^>
echo ^<head^>
echo   ^<meta charset="utf-8"^>
echo   ^<title^>Slide Library^</title^>
echo   ^<link rel="stylesheet" href="https://unpkg.com/reveal.js/dist/reveal.css"^>
echo   ^<link rel="stylesheet" href="https://unpkg.com/reveal.js/dist/theme/white.css"^>
echo   ^<link rel="stylesheet" href="shared/css/custom.css"^>
echo ^</head^>
echo ^<body^>
echo   ^<div class="reveal"^>
echo     ^<div class="slides"^>
echo       ^<section data-markdown="courses/%COURSE%/slides.md" data-separator="^\-\-\-$"^>^</section^>
echo     ^</div^>
echo   ^</div^>
echo.
echo   ^<script src="https://unpkg.com/reveal.js/dist/reveal.js"^>^</script^>
echo   ^<script src="https://unpkg.com/reveal.js/plugin/markdown/markdown.js"^>^</script^>
echo   ^<script^>
echo     Reveal.initialize({ plugins: [ RevealMarkdown ] });
echo   ^</script^>
echo ^</body^>
echo ^</html^>
) > "index.html"

REM --- README ---
(
echo # Slide Library (PoC^)
echo.
echo ## Run locally
echo Open `index.html` in a browser.
echo.
echo ## Course folders
echo Each course lives under `courses/<course-id>/` with:
echo - `slides.md` (rendered as Reveal.js slides)
echo - `course.json` (metadata for indexing and AI workflows)
echo - `assets/` (images, video)
echo.
echo ## Next steps
echo - Copy runnable content into `/docs` for GitHub Pages deployment
echo - Add scripts under `/scripts` for embeddings and drift review
) > "README.md"

echo.
echo ============================================================
echo Done.
echo - Root runner: %CD%\index.html
echo - Course:       %CD%\courses\%COURSE%\slides.md
echo ============================================================
pause
