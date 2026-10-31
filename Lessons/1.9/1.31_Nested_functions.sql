SELECT ['python','sql','r'] AS skills_array;


WITH skills AS(
    SELECT 'python'  AS skill
    UNION ALL
    SELECT 'sql'
    UNION ALL
    SELECT 'r'
),skills_array AS (
    SELECT ARRAY_AGG(skill ORDER BY skill) AS skills
    FROM skills
)
SELECT skills[1]
FROM skills_array;


--STRUCT

SELECT{skill:'python',type:'programming'} AS skill_struct;

WITH skill_struct AS(
    SELECT 
        STRUCT_PACK(
            skill:='python',
            type:='programming'
        )AS s
)
SELECT 
    s.skill,
    s.type
FROM skill_struct; 



WITH skill_table AS(
    SELECT 'python'  AS skills, 'programming' AS types
    UNION ALL
    SELECT 'sql', 'query language'
    UNION ALL
    SELECT 'r', 'programming'
)
SELECT 
    STRUCT_PACK(
        skill:=skills,
        type:=types
    )
FROM skill_table;


--Array of structs

SELECT[
    {skill:'python',type:'programming'},
    {skill:'sql',type:'query language'},
    {skill:'r',type:'programming'}
];


WITH skill_table AS(
    SELECT 'python'  AS skills, 'programming' AS types
    UNION ALL
    SELECT 'sql', 'query language'
    UNION ALL
    SELECT 'r', 'programming'
)
SELECT 
    ARRAY_AGG(
        STRUCT_PACK(
            skill:=skills,
            type:=types
        )
    )
FROM skill_table;


WITH skill_table AS(
    SELECT 'python'  AS skills, 'programming' AS types
    UNION ALL
    SELECT 'sql', 'query language'
    UNION ALL
    SELECT 'r', 'programming'
),skills_array_struct AS(
    SELECT 
        ARRAY_AGG(
            STRUCT_PACK(
                skill:=skills,
                type:=types
            )
        )array_struct
    FROM skill_table
)
SELECT
    array_struct[1].skill
FROM skills_array_struct;



--MAP

SELECT MAP{'skill':'python'};