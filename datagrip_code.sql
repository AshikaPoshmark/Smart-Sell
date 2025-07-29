
---  Listers who got smart sell activated

select DATE(smart_sell_activated_at),
CASE
          WHEN lister.extended_signup_segments_v3.l23 IN (
            '012',
            '013',
            '016',
            '027',
            '029',
            '035',
            '038',
            '039',
            '046',
            '052',
            '060',
            '061',
            '074',
            '079',
            '088',
            '100',
            '108',
            '113',
            '126',
            '128'
          ) THEN 'Smart Sell Only'
          WHEN lister.extended_signup_segments_v3.l23 IN (
            '002',
            '005',
            '008',
            '017',
            '023',
            '033',
            '036',
            '041',
            '056',
            '063',
            '075',
            '076',
            '085',
            '086',
            '090',
            '093',
            '102',
            '110',
            '117',
            '121'
          ) THEN 'Smart Sell Top, 1P Underneath'
          WHEN lister.extended_signup_segments_v3.l23 IN (
            '010',
            '019',
            '021',
            '024',
            '042',
            '044',
            '049',
            '069',
            '070',
            '077',
            '078',
            '089',
            '096',
            '099',
            '101',
            '103',
            '112',
            '120',
            '123',
            '124'
          ) THEN '1P Top, Smart Sell Underneath'
          WHEN lister.extended_signup_segments_v3.l23 IN (
            '001',
            '004' ,
            '018',
            '022',
            '026',
            '032',
            '034',
            '037',
            '047',
            '050',
            '058',
            '059',
            '064',
            '065',
            '080',
            '081',
            '094',
            '109',
            '116',
            '127'
          ) THEN 'CONTROL'
          ELSE 'NOT TESTED'
        END AS test_group,
        CASE
            WHEN lister.extended_signup_segments_v3.l23 IN ( '012','013','002', '005','010', '019','001', '004')
               THEN '5%_exposure_group'
            WHEN lister.extended_signup_segments_v3.l23 IN ('016', '027','008', '017', '021', '024','018', '022')
               THEN '10%_exposed_group'
            WHEN lister.extended_signup_segments_v3.l23 IN ('029', '035', '038', '039', '046', '052',
                                                            '023', '033', '036', '041', '056', '063',
                                                            '042', '044', '049', '069', '070', '077',
                                                            '026', '032', '034', '037', '047', '050')
               THEN '20%_exposed_group'
            WHEN lister.extended_signup_segments_v3.l23 IN ('060','061','074','079','088','100','108','113','126','128',
                                                            '075','076','085','086','090','093','102','110','117','121',
                                                            '078','089','096','099','101','103','112','120','123','124',
                                                            '058','059','064','065','080','081','094','109','116','127')
                THEN '40%_exposed_group'
           ELSE 'No_test_group'
           END AS  smart_sell_exposed_test_group,

      count(dw_users_cs.user_id)

from analytics.dw_users_cs
left join analytics.dw_users as lister on lister.user_id = dw_users_cs.user_id
 where smart_sell_activated_at is not null
group by 1,2,3 order by 1 desc,2;



-------------  Listing Published vs updated with Smart Sell   -----------------------------------------------------------------------------------------------
-- This looks into the no of listings that are smart sell enabled in published flow or update flow

SELECT  DATE(smart_sell_enabled_at),
CASE
          WHEN lister.extended_signup_segments_v3.l23 IN (
            '012',
            '013',
            '016',
            '027',
            '029',
            '035',
            '038',
            '039',
            '046',
            '052',
            '060',
            '061',
            '074',
            '079',
            '088',
            '100',
            '108',
            '113',
            '126',
            '128'
          ) THEN 'Smart Sell Only'
          WHEN lister.extended_signup_segments_v3.l23 IN (
            '002',
            '005',
            '008',
            '017',
            '023',
            '033',
            '036',
            '041',
            '056',
            '063',
            '075',
            '076',
            '085',
            '086',
            '090',
            '093',
            '102',
            '110',
            '117',
            '121'
          ) THEN 'Smart Sell Top, 1P Underneath'
          WHEN lister.extended_signup_segments_v3.l23 IN (
            '010',
            '019',
            '021',
            '024',
            '042',
            '044',
            '049',
            '069',
            '070',
            '077',
            '078',
            '089',
            '096',
            '099',
            '101',
            '103',
            '112',
            '120',
            '123',
            '124'
          ) THEN '1P Top, Smart Sell Underneath'
          WHEN lister.extended_signup_segments_v3.l23 IN (
            '001',
            '004' ,
            '018',
            '022',
            '026',
            '032',
            '034',
            '037',
            '047',
            '050',
            '058',
            '059',
            '064',
            '065',
            '080',
            '081',
            '094',
            '109',
            '116',
            '127'
          ) THEN 'CONTROL'
          ELSE 'NOT TESTED'
        END AS test_group,
        CASE
            WHEN lister.extended_signup_segments_v3.l23 IN ( '012','013','002', '005','010', '019','001', '004')
               THEN '5%_exposure_group'
            WHEN lister.extended_signup_segments_v3.l23 IN ('016', '027','008', '017', '021', '024','018', '022')
               THEN '10%_exposed_group'
            WHEN lister.extended_signup_segments_v3.l23 IN ('029', '035', '038', '039', '046', '052',
                                                            '023', '033', '036', '041', '056', '063',
                                                            '042', '044', '049', '069', '070', '077',
                                                            '026', '032', '034', '037', '047', '050')
               THEN '20%_exposed_group'
            WHEN lister.extended_signup_segments_v3.l23 IN ('060','061','074','079','088','100','108','113','126','128',
                                                            '075','076','085','086','090','093','102','110','117','121',
                                                            '078','089','096','099','101','103','112','120','123','124',
                                                            '058','059','064','065','080','081','094','109','116','127')
                THEN '40%_exposed_group'
           ELSE 'No_test_group'
           END AS  smart_sell_exposed_test_group,
    coalesce(seller_gmv_segments_start.user_segment_daily, '1. No Sales')  AS seller_segment,

        count( distinct dw_listings.seller_id) as listers,
        count(distinct dw_listings.listing_id) as listings,
        count(distinct case when date_add('minute',1,first_published_at) >= smart_sell_enabled_at AND offer_auto_actions_v2_enabled is true THEN  dw_listings.seller_id end ) as lister_published_with_smart_sell,
        count(distinct case when date_add('minute',1,first_published_at) >= smart_sell_enabled_at AND offer_auto_actions_v2_enabled is true THEN  dw_listings.listing_id end ) as listing_published_with_smart_sell,
        count(distinct case when date_add('minute',1,first_published_at) < smart_sell_enabled_at AND offer_auto_actions_v2_enabled is true THEN  dw_listings.seller_id end ) as lister_updated_with_smart_sell,
        count(distinct case when date_add('minute',1,first_published_at) < smart_sell_enabled_at AND offer_auto_actions_v2_enabled is true THEN  dw_listings.listing_id end ) as listing_updated_with_smart_sell
from analytics.dw_listings
    left join analytics.dw_listings_cs on dw_listings.listing_id = dw_listings_cs.listing_id
    left join analytics.dw_users  as lister on seller_id = user_id
    LEFT JOIN analytics.dw_user_segments  AS seller_gmv_segments_start ON dw_listings.seller_id = seller_gmv_segments_start.id and seller_gmv_segments_start.user_type = 'seller'  and

    (DATE(dw_listings_cs.smart_sell_enabled_at )) > (DATE(seller_gmv_segments_start.start_date )) and  (DATE(dw_listings_cs.smart_sell_enabled_at )) <= (DATE(coalesce(seller_gmv_segments_start.end_date, GETDATE()) ))

        where date(smart_sell_enabled_at) > '2025-06-30' and smart_sell_enabled_at is not null
    group by 1,2,3,4
    order by 1 desc,2,3,4;


-------------------------------------------- Smart sell Listings with Offer & Orders -------------------------------------------------------

-- Listings with smart sell enabled / got offers / orders Base table

drop table if exists analytics_scratch.ashika_smart_sell_listings;
create table analytics_scratch.ashika_smart_sell_listings as
select first_published_at as first_published_date,
         smart_sell_enabled_at as smart_sell_enabled_date,
          smart_sell_activated_at as smart_sell_activated_date,
            dw_listings.listing_id,
           dw_listings.seller_id,
           CASE
          WHEN lister.extended_signup_segments_v3.l23 IN (
            '012',
            '013',
            '016',
            '027',
            '029',
            '035',
            '038',
            '039',
            '046',
            '052',
            '060',
            '061',
            '074',
            '079',
            '088',
            '100',
            '108',
            '113',
            '126',
            '128'
          ) THEN 'Smart Sell Only'
          WHEN lister.extended_signup_segments_v3.l23 IN (
            '002',
            '005',
            '008',
            '017',
            '023',
            '033',
            '036',
            '041',
            '056',
            '063',
            '075',
            '076',
            '085',
            '086',
            '090',
            '093',
            '102',
            '110',
            '117',
            '121'
          ) THEN 'Smart Sell Top, 1P Underneath'
          WHEN lister.extended_signup_segments_v3.l23 IN (
            '010',
            '019',
            '021',
            '024',
            '042',
            '044',
            '049',
            '069',
            '070',
            '077',
            '078',
            '089',
            '096',
            '099',
            '101',
            '103',
            '112',
            '120',
            '123',
            '124'
          ) THEN '1P Top, Smart Sell Underneath'
          WHEN lister.extended_signup_segments_v3.l23 IN (
            '001',
            '004' ,
            '018',
            '022',
            '026',
            '032',
            '034',
            '037',
            '047',
            '050',
            '058',
            '059',
            '064',
            '065',
            '080',
            '081',
            '094',
            '109',
            '116',
            '127'
          ) THEN 'CONTROL'
          ELSE 'NOT TESTED'
        END AS test_group,
        CASE
            WHEN lister.extended_signup_segments_v3.l23 IN ( '012','013','002', '005','010', '019','001', '004')
               THEN '5%_exposure_group'
            WHEN lister.extended_signup_segments_v3.l23 IN ('016', '027','008', '017', '021', '024','018', '022')
               THEN '10%_exposed_group'
            WHEN lister.extended_signup_segments_v3.l23 IN ('029', '035', '038', '039', '046', '052',
                                                            '023', '033', '036', '041', '056', '063',
                                                            '042', '044', '049', '069', '070', '077',
                                                            '026', '032', '034', '037', '047', '050')
               THEN '20%_exposed_group'
            WHEN lister.extended_signup_segments_v3.l23 IN ('060','061','074','079','088','100','108','113','126','128',
                                                            '075','076','085','086','090','093','102','110','117','121',
                                                            '078','089','096','099','101','103','112','120','123','124',
                                                            '058','059','064','065','080','081','094','109','116','127')
                THEN '40%_exposed_group'
           ELSE 'No_test_group'
           END AS  smart_sell_exposed_test_group,
           buyer_id,
           offer_initiated_by,
           dw_offers.offer_auto_actions_v2_enabled as offer_with_smart_sell,
           case when count_smart_Sell >0 then 'Yes'
               ELSE 'No' end as is_smart_sell_offer_action,
           dw_offers.offer_auto_actions_min_price_amount as offer_smart_sell_min_amt,
           dw_listings.offer_auto_actions_min_price_usd as listing_smart_sell_min_amt_usd,
           dw_listings.offer_auto_actions_min_price as listing_smart_sell_min_amt,
           dw_listings.offer_auto_actions_v2_enabled as listing_with_smart_sell,
           dw_offers.offer_id as offer_id,
           dw_offers.order_id as offer_order,
           dw_offer_messages.offer_auto_action as smart_sell_accepted,
           dw_offers.created_at as offer_created_date,
           dw_offers.offer_state,
           CASE WHEN dw_offers.offer_broadcast_id is not null THEN 'Yes'
                ELSE 'No' END AS Is_OTL,
          CASE WHEN dw_offers.offer_id is not null THEN 'Yes'
                ELSE 'No' END AS IS_listing_with_offer,
        CASE WHEN dw_offers.listings_count > 1 THEN 'Yes'
            ELSE 'No' END AS Is_bundled,
        home_domain,
        dw_listings_cs.first_listing_price_amount_usd * 0.01  AS first_listing_usd_price,
            CASE
WHEN (dw_listings_cs.first_listing_price_amount_usd * 0.01)  < 15.0 THEN 'A. < 15.0'
WHEN (dw_listings_cs.first_listing_price_amount_usd * 0.01)  >= 15.0 AND (dw_listings_cs.first_listing_price_amount_usd * 0.01)  < 30.0 THEN 'B. >= 15.0 and < 30.0'
WHEN (dw_listings_cs.first_listing_price_amount_usd * 0.01)  >= 30.0 AND (dw_listings_cs.first_listing_price_amount_usd * 0.01)  < 50.0 THEN 'C. >= 30.0 and < 50.0'
WHEN (dw_listings_cs.first_listing_price_amount_usd * 0.01)  >= 50.0 AND (dw_listings_cs.first_listing_price_amount_usd * 0.01)  < 100.0 THEN 'D. >= 50.0 and < 100.0'
WHEN (dw_listings_cs.first_listing_price_amount_usd * 0.01)  >= 100.0 AND (dw_listings_cs.first_listing_price_amount_usd * 0.01)  < 500.0 THEN 'E. >= 100.0 and < 500.0'
WHEN (dw_listings_cs.first_listing_price_amount_usd * 0.01)  >= 500.0 AND (dw_listings_cs.first_listing_price_amount_usd * 0.01)  < 2000.0 THEN 'F. >= 500.0 and < 2000.0'
WHEN (dw_listings_cs.first_listing_price_amount_usd * 0.01)  >= 2000.0 AND (dw_listings_cs.first_listing_price_amount_usd * 0.01)  < 5000.0 THEN 'G. >= 2000.0 and < 5000.0'
WHEN (dw_listings_cs.first_listing_price_amount_usd * 0.01)  >= 5000.0 THEN 'H. >= 5000.0'
ELSE 'I. Undefined'
END AS first_listing_usd_price_tier,
    coalesce(seller_gmv_segments_start.user_segment_daily, '1. No Sales')  AS seller_segment


        from analytics.dw_listings
            left join analytics.dw_listings_cs on dw_listings.listing_id = dw_listings_cs.listing_id
    left join analytics.dw_offers_listings on dw_listings.listing_id = dw_offers_listings.listing_id
    left join analytics.dw_offers on dw_offers_listings.offer_id = dw_offers.offer_id
    left join analytics.dw_users as lister on dw_listings.seller_id = lister.user_id
    left join analytics.dw_users_cs on dw_listings.seller_id = dw_users_cs.user_id
    left join (select * from analytics.dw_offer_messages where state = 'Accepted') as dw_offer_messages  on dw_offer_messages.offer_id = dw_offers.offer_id and dw_offers.offer_state = 'Completed'
     LEFT JOIN analytics.dw_user_segments  AS seller_gmv_segments_start ON dw_listings.seller_id = seller_gmv_segments_start.id
                and seller_gmv_segments_start.user_type = 'seller'
                and (DATE(dw_listings_cs.smart_sell_enabled_at )) > (DATE(seller_gmv_segments_start.start_date )) and  (DATE(dw_listings_cs.smart_sell_enabled_at )) <= (DATE(coalesce(seller_gmv_segments_start.end_date, GETDATE()) ))
    LEFT JOIN (select offer_id, sum(case when offer_auto_action is true then 1 else 0 end) as count_smart_Sell from analytics.dw_offer_messages
                        where date(dw_offer_messages.created_at) > '2025-06-30' group by 1 ) as a on a.offer_id = dw_offers.offer_id
    where smart_sell_enabled_at is not null and is_valid_listing is true;




------- calculated the offer order conversion of smart sell enabled listing



SELECT Date(smart_sell_enabled_date),
       offer_initiated_by,
       count(distinct listing_id),
       count( distinct case when IS_listing_with_offer ='Yes' and Is_bundled = 'No' then listing_id end ) as listings_with_offer,
       count( distinct case when IS_listing_with_offer ='Yes' and Is_bundled = 'No'
                        and ashika_smart_sell_listings.smart_sell_enabled_date <= offer_created_date  then listing_id end ) as listings_with_offer_after_smart_sell_enabled,
       count( distinct case when (listing_with_smart_sell is true) and ( offer_with_smart_sell is null or offer_with_smart_sell is true) and Is_bundled = 'No'
           and ashika_smart_sell_listings.smart_sell_enabled_date <= offer_created_date then listing_id end ) as listings_with_smart_sell_offer,
       count( distinct case when offer_order is not null and  Is_bundled = 'No' then listing_id end ) as listings_with_offer_order,
       count( distinct case when offer_order is not null  and ashika_smart_sell_listings.smart_sell_enabled_date <= offer_created_date and Is_bundled = 'No' then listing_id end ) as listings_with_offer_order_after_smart_sell_enabled,
       count( distinct case when (listing_with_smart_sell is true) and ( offer_with_smart_sell is null or offer_with_smart_sell is true)
                    and ashika_smart_sell_listings.smart_sell_enabled_date <= offer_created_date and ashika_smart_sell_listings.offer_order is not null and Is_bundled = 'No' then listing_id end ) as listings_with_smart_sell_accepted_offer

from analytics_scratch.ashika_smart_sell_listings
where (offer_created_date < '2025-07-21'  or offer_created_date is null) and smart_sell_enabled_date < '2025-07-21'
group by 1,2
order by  1 desc;




