with clean_data as (
 select
 initcap(
      trim(
        replace(
            case
            when name like '%, masakan%' then 'masakan ' || replace(name, ', masakan', '')
            when name like '%masakan%' then 'masakan ' || replace(name, ', masakan', '') 
            else replace(name, ',', '') 
            end,
            ',', ''
        ) 
      )
 ) as name,
 energy_kcal,
 cast(replace(serving_size, ' g', '') as float64) as weight_g,
 protein_g,
 carbohydrate_g,
 fat_g,
 sugar_g,
 sodium_mg,
 fiber_g,
 energy_percentage_dv,
 protein_percentage_dv,
 carbohydrate_percentage_dv,
 fat_percentage_dv,
 sodium_percentage_dv,
  case 
    when name like '%masakan%'
          or name like '%mentah%'
          or name like '%segar%' and manufacturer = 'Tidak Diketahui' then 'Traditional'
    when regexp_contains(name, r'(?i)milk|saus|sugar|original|steak|flavour|Chatime|Cookies|Sirup|Caffe|Kecap|Tepung|gummy|pasta|yupi|swallow|permen|gula|wine') then 'Olahan/Brand'
    when manufacturer != 'Tidak Diketahui' and manufacturer is not null then 'Olahan/Brand'
    else 'Traditional' 
  end as Category
 from `analisis_gizi.nilai_gizi`
 where serving_size is not null and serving_size != '0 g'
)
select
 name,
 Category,
 energy_kcal,
 weight_g,
 protein_g,
 carbohydrate_g,
 fat_g,
 sugar_g,
 sodium_mg,
 fiber_g,
 energy_percentage_dv,
 protein_percentage_dv,
 carbohydrate_percentage_dv,
 fat_percentage_dv,
 sodium_percentage_dv,
round((energy_kcal / weight_g) * 100, 2) as energy_per_100g,
round((protein_g / weight_g) * 100, 2) as protein_per_100g,
round((fat_g / weight_g) * 100, 2) as fat_per_100g,

round((sodium_mg / weight_g) * 100, 2) as sodium_per_100g,

round((protein_g + fiber_g) / nullif(energy_kcal, 0), 4) as nutrition_desnity
from clean_data

