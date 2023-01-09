=begin

You're designing an application for Hospital staff to track their patients. You have identified three classes that you need: Hospital, Inpatient, and Outpatient. Each Hospital has one or more Inpatients and one or more Outpatients. In our application, the Inpatients and Outpatients don't interact directly, and neither needs to know anything about the Hospital to which they belong.

Given the above details, what kind of Object Oriented relationship (inheritance, mixin, collaboration, or none) should exist between objects of each pair of classes, and why?

Hospital and Inpatient
Hospital and Outpatient
Inpatient and Outpatient
Use the description of the design as written; don't read additional details into it that are not explicitly stated.

Your Answer
Hospital and Inpatient: Hospital should be able to accept Inpatient objects as collaborators.

Hospital and Outpatient: Hospital should be able to take Outpatient objects as collaborators.

Inpatient and Outpatient: These classes are not related although they could both mixin the same modules.

=end